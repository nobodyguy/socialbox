class QuizzesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @quizzes = Quiz.where("user_id = ?", current_user.id)
  end

  def show
    @quiz = Quiz.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(params[:quiz])
    if @quiz.save
      redirect_to @quiz, :notice => "Successfully created quiz."
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def update
    @quiz = Quiz.find_by_id_and_user_id(params[:id], current_user.id)
    if @quiz.update_attributes(params[:quiz])
      redirect_to @quiz, :notice  => "Successfully updated quiz."
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find_by_id_and_user_id(params[:id], current_user.id)
    @quiz.destroy
    redirect_to quizzes_url, :notice => "Successfully destroyed quiz."
  end
end
