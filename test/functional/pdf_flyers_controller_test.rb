require 'test_helper'

class PdfFlyersControllerTest < ActionController::TestCase
  setup do
    @pdf_flyer = pdf_flyers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdf_flyers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf_flyer" do
    assert_difference('PdfFlyer.count') do
      post :create, pdf_flyer: @pdf_flyer.attributes
    end

    assert_redirected_to pdf_flyer_path(assigns(:pdf_flyer))
  end

  test "should show pdf_flyer" do
    get :show, id: @pdf_flyer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pdf_flyer.to_param
    assert_response :success
  end

  test "should update pdf_flyer" do
    put :update, id: @pdf_flyer.to_param, pdf_flyer: @pdf_flyer.attributes
    assert_redirected_to pdf_flyer_path(assigns(:pdf_flyer))
  end

  test "should destroy pdf_flyer" do
    assert_difference('PdfFlyer.count', -1) do
      delete :destroy, id: @pdf_flyer.to_param
    end

    assert_redirected_to pdf_flyers_path
  end
end
