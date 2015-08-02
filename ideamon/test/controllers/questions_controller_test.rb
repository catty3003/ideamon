require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { f10: @question.f10, f11: @question.f11, f12: @question.f12, f13: @question.f13, f14: @question.f14, f15: @question.f15, f16: @question.f16, f17: @question.f17, f18: @question.f18, f1: @question.f1, f2: @question.f2, f3: @question.f3, f4: @question.f4, f5: @question.f5, f6: @question.f6, f7: @question.f7, f8: @question.f8, f9: @question.f9 }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { f10: @question.f10, f11: @question.f11, f12: @question.f12, f13: @question.f13, f14: @question.f14, f15: @question.f15, f16: @question.f16, f17: @question.f17, f18: @question.f18, f1: @question.f1, f2: @question.f2, f3: @question.f3, f4: @question.f4, f5: @question.f5, f6: @question.f6, f7: @question.f7, f8: @question.f8, f9: @question.f9 }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
