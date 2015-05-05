require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  setup do
    @attraction = attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post :create, attraction: { address: @attraction.address, description: @attraction.description, duration: @attraction.duration, more_info: @attraction.more_info, name: @attraction.name, opening_hour: @attraction.opening_hour, picture: @attraction.picture, reservation: @attraction.reservation, type: @attraction.type, url: @attraction.url }
    end

    assert_redirected_to attraction_path(assigns(:attraction))
  end

  test "should show attraction" do
    get :show, id: @attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction
    assert_response :success
  end

  test "should update attraction" do
    patch :update, id: @attraction, attraction: { address: @attraction.address, description: @attraction.description, duration: @attraction.duration, more_info: @attraction.more_info, name: @attraction.name, opening_hour: @attraction.opening_hour, picture: @attraction.picture, reservation: @attraction.reservation, type: @attraction.type, url: @attraction.url }
    assert_redirected_to attraction_path(assigns(:attraction))
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete :destroy, id: @attraction
    end

    assert_redirected_to attractions_path
  end
end
