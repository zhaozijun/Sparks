class PapersController < ApplicationController
  before_filter :set_paper, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @papers = current_author.papers.all
    respond_with(current_author, @papers)
  end

  def show
    respond_with(current_author, @paper)
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
    respond_with(current_author, @paper)
  end

  def destroy
    @paper.destroy
    respond_with(current_author, @paper)
  end
  
  def userindex
    @papers = Paper.all 
  end
  
  def userpapershow
    @paper = Paper.find(params[:id])
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def user_params
      params.require(:paper).permit(:title, :file, :demo)
    end
end
