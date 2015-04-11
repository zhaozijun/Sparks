class PapersController < ApplicationController
  before_filter :set_paper, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @papers = Paper.all
    respond_with(@papers)
  end

  def show
    respond_with(@paper)
  end

  def new
    @paper = Paper.new
    respond_with(@paper)
  end

  def edit
  end

  def create
    @paper = Paper.new(params[:paper])
    @paper.save
    respond_with(@paper)
  end

  def update
    @paper.update_attributes(params[:paper])
    respond_with(@paper)
  end

  def destroy
    @paper.destroy
    respond_with(@paper)
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end
end
