require 'test_helper'

class CreativitycardsControllerTest < ActionController::TestCase
  setup do
    @creativitycard = creativitycards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creativitycards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creativitycard" do
    assert_difference('Creativitycard.count') do
      post :create, creativitycard: { idea_id: @creativitycard.idea_id, project_id: @creativitycard.project_id, suggestion: @creativitycard.suggestion, user_id: @creativitycard.user_id }
    end

    assert_redirected_to creativitycard_path(assigns(:creativitycard))
  end

  test "should show creativitycard" do
    get :show, id: @creativitycard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @creativitycard
    assert_response :success
  end

  test "should update creativitycard" do
    patch :update, id: @creativitycard, creativitycard: { idea_id: @creativitycard.idea_id, project_id: @creativitycard.project_id, suggestion: @creativitycard.suggestion, user_id: @creativitycard.user_id }
    assert_redirected_to creativitycard_path(assigns(:creativitycard))
  end

  test "should destroy creativitycard" do
    assert_difference('Creativitycard.count', -1) do
      delete :destroy, id: @creativitycard
    end

    assert_redirected_to creativitycards_path
  end
end
