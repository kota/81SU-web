require 'test_helper'

class Api::KifusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_kifus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kifu" do
    assert_difference('Api::Kifu.count') do
      post :create, :kifu => { }
    end

    assert_redirected_to kifu_path(assigns(:kifu))
  end

  test "should show kifu" do
    get :show, :id => api_kifus(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => api_kifus(:one).to_param
    assert_response :success
  end

  test "should update kifu" do
    put :update, :id => api_kifus(:one).to_param, :kifu => { }
    assert_redirected_to kifu_path(assigns(:kifu))
  end

  test "should destroy kifu" do
    assert_difference('Api::Kifu.count', -1) do
      delete :destroy, :id => api_kifus(:one).to_param
    end

    assert_redirected_to api_kifus_path
  end
end
