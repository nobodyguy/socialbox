require File.dirname(__FILE__) + '/../spec_helper'

describe QuizzesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Quiz.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Quiz.any_instance.stub(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Quiz.any_instance.stub(:valid?).and_return(true)
    post :create
    response.should redirect_to(quiz_url(assigns[:quiz]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Quiz.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Quiz.any_instance.stub(:valid?).and_return(false)
    put :update, :id => Quiz.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Quiz.any_instance.stub(:valid?).and_return(true)
    put :update, :id => Quiz.first
    response.should redirect_to(quiz_url(assigns[:quiz]))
  end

  it "destroy action should destroy model and redirect to index action" do
    quiz = Quiz.first
    delete :destroy, :id => quiz
    response.should redirect_to(quizzes_url)
    Quiz.exists?(quiz.id).should be_false
  end
end
