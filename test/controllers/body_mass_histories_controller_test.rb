require 'test_helper'

class BodyMassHistoriesControllerTest < ActionController::TestCase
  setup do
    @body_mass_history = body_mass_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:body_mass_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create body_mass_history" do
    assert_difference('BodyMassHistory.count') do
      post :create, body_mass_history: { body_mass: @body_mass_history.body_mass, height: @body_mass_history.height, weight: @body_mass_history.weight }
    end

    assert_redirected_to body_mass_history_path(assigns(:body_mass_history))
  end

  test "should show body_mass_history" do
    get :show, id: @body_mass_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @body_mass_history
    assert_response :success
  end

  test "should update body_mass_history" do
    patch :update, id: @body_mass_history, body_mass_history: { body_mass: @body_mass_history.body_mass, height: @body_mass_history.height, weight: @body_mass_history.weight }
    assert_redirected_to body_mass_history_path(assigns(:body_mass_history))
  end

  test "should destroy body_mass_history" do
    assert_difference('BodyMassHistory.count', -1) do
      delete :destroy, id: @body_mass_history
    end

    assert_redirected_to body_mass_histories_path
  end
end
