class QuestionsController < ApplicationController
  before_filter :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @paper = Paper.find(params[:paper_id])
    @questions = @paper.questions.all
    respond_with(@paper, @questions)
  end

  def show
    @paper = Paper.find(params[:paper_id])
    respond_with(@paper, @question)
  end

  def new
    @paper = Paper.find(params[:paper_id])
    @question = @paper.questions.new
    respond_with(@paper, @question)
  end

  def edit
    @paper = Paper.find(params[:paper_id])
  end

  def create
    @paper = Paper.find(params[:paper_id])
    @question = @paper.questions.new(params[:question])
    @question.save
    respond_with(@paper, @question)
  end

  def update
    @paper = Paper.find(params[:paper_id])
    @question.update_attributes(params[:question])
    respond_with(@paper, @question)
  end

  def destroy
    @paper = Paper.find(params[:paper_id])
    @question.destroy
    respond_with(@paper, @question)
  end
  
  def userquestionindex
    @paper = Paper.find(params[:paper_id])
    @questions = @paper.questions.all
  end
  
  def userquestionshow
    @paper = Paper.find(params[:paper_id])
    @question = @paper.questions.find(params[:id])
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
end
