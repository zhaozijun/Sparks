class PapersController < ApplicationController
  before_filter :set_paper, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_author!, only: [:userindex, :userpapershow]
  respond_to :html

  def index
    @papers = current_author.papers.all
    respond_with(current_author, @papers)
  end

  def show
    @paper = Paper.find(params[:id])
    @questions = @paper.questions.all
    respond_with(current_author, @paper, @questions)
    
  end

  def new
    @paper = current_author.papers.new
    respond_with(current_author, @paper)
  end

  def edit
  end

  def create
    @paper = current_author.papers.new(params[:paper])
    @paper.save
    id_and_key = scribd_upload_paper(@paper.author_id, @paper.id, @paper.demo.filename)
    if (id_and_key != nil)
      @paper.scribd_doc_id = id_and_key["doc_id"]
      @paper.scribd_access_key = id_and_key["access_key"]
    else 
      @paper.scribd_doc_id = nil
      @paper.scribd_access_key = nil
    end
    @paper.save
    respond_with(current_author, @paper)
  end

  def update
    demo = params[:paper][:demo]    
    @paper.update_attributes(params[:paper])

    # Update the demo if the slides have changed
    if (demo != nil)
      filename = demo.original_filename
      id_and_key = scribd_upload_paper(@paper.author_id, @paper.id, @paper.demo.filename)
      if (id_and_key != nil)
        @paper.scribd_doc_id = id_and_key["doc_id"]
        @paper.scribd_access_key = id_and_key["access_key"]
        @paper.save
      end
    end
    
    # Remove the demo if "remove_demo" is set to "1"
    if (params[:paper]["remove_demo"] == "1")
      destroy_scribd = {scribd_doc_id: nil, scribd_access_key: nil}
      @paper.update_attributes(destroy_scribd)
    end
    respond_with(current_author, @paper)
  end

  def destroy
    @paper.destroy
    respond_with(current_author, @paper)
  end
  
  def userindex
    if author_signed_in?
      sign_out current_author
    end
    @papers = Paper.all 
  end
  
  def userpapershow
    if author_signed_in?
      sign_out current_author
    end
    @paper = Paper.find(params[:id])
    @questions = @paper.questions.all
    respond_with(current_author, @paper, @questions)
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def user_params
      params.require(:paper).permit(:title, :file, :demo)
    end
    
    def scribd_upload_paper(author_id, paper_id, filename)
      if (filename == "" || filename == nil)
        return nil
      end
        
      Scribd::API.instance.key = '6a6ssxkqj19vilb8m2jr3semuffnvg'
      Scribd::API.instance.secret = 'sec-u7z2fe34090u51k7hilqk8h3dp'
  #    Scribd::API.instance.asynchronous = true
      begin
        Scribd::User.login 'hamidhasan1ahmed', 'zt6AQ3BKa6WqtGFf'

        # Set to phantom user
        #Scribd::API.instance.user = author_id.to_s
        # Upload the document from a file
        print "Uploading a document with author id #{author_id}, paper id #{paper_id} and filename #{filename}"

        doc = Scribd::Document.upload(:file => "#{Rails.root.to_s}/public/uploads/paper/demo/#{paper_id}/#{filename}")
        # puts "Done doc_id=#{doc.id}, doc_access_key=#{doc.access_key}"

        # Poll API until conversion is complete
        while (doc.conversion_status == 'PROCESSING')
          puts "Document conversion is processing"
          sleep(2) # Very important to sleep to prevent a runaway loop that will get your app blocked
        end
        puts "Document conversion is complete"

        # Edit various options of the document
        # Note you can also edit options before your doc is done converting
        doc.title = "#{filename}"
        doc.description = "#{filename}"
        doc.access = 'private'
        doc.language = 'en'
        doc.license = 'c'
        doc.tags = 'test,api'
        doc.show_ads = false
        doc.save

        # Delete the uploaded document
        print "Deleting a document ... "
        #doc.destroy
        puts "Done doc_id=#{doc.id} access_key=#{doc.access_key}"
        return {"doc_id" => doc.id, "access_key" => doc.access_key }
      rescue Scribd::ResponseError => e
        puts "failed code=#{e.code} error='#{e.message}'"
        return nil
      end
    end
    
end
