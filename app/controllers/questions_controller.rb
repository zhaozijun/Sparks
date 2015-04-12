class QuestionsController < ApplicationController
  before_filter :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @paper = current_author.papers.find(params[:paper_id])
    @questions = @paper.questions.all
    respond_with(current_author, @paper, @questions)
  end

  def show
    @paper = current_author.papers.find(params[:paper_id])
    respond_with(current_author, @paper, @question)
  end

  def new
    @paper = current_author.papers.find(params[:paper_id])
    @question = @paper.questions.new
    respond_with(current_author, @paper, @question)
  end

  def edit
    @paper = current_author.papers.find(params[:paper_id])
  end

  def create
    @paper = current_author.papers.find(params[:paper_id])
    @question = @paper.questions.new(params[:question])
    @question.save
    respond_with(current_author, @paper, @question)
  end

  def update
    @paper = current_author.papers.find(params[:paper_id])
    @question.update_attributes(params[:question])
    respond_with(current_author, @paper, @question)
  end

  def destroy
    @paper = current_author.papers.find(params[:paper_id])
    @question.destroy
    respond_with(current_author, @paper, @question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
end
