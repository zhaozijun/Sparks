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
    respond_with(current_author, @paper)
  end

  def update
    @paper.update_attributes(params[:paper])
    #respond_with(current_author, @paper)
    respond_with [current_author, @paper] do |format|
        format.html {redirect_to author_paper_path, notice: "Update!"}
      end
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
end
