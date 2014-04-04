require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get edit" do
    get :edit, id: @service.to_param
    assert_response :success
  end

  test "should update service" do
    put :update, id: @service.to_param, service: @service.attributes
    assert_redirected_to service_path(assigns(:service))
  end
end
