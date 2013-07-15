require 'test_helper'

class LettersControllerTest < ActionController::TestCase
  setup do
    @letter = letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create letter" do
    assert_difference('Letter.count') do
      post :create, letter: { content: @letter.content, crypted_password: @letter.crypted_password, email: @letter.email, express: @letter.express, paper_id: @letter.paper_id, receiver_address: @letter.receiver_address, receiver_phone: @letter.receiver_phone, receiver_phone: @letter.receiver_phone, salt: @letter.salt, sender_address: @letter.sender_address, sender_name: @letter.sender_name, sender_phone: @letter.sender_phone, user_id: @letter.user_id }
    end

    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should show letter" do
    get :show, id: @letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @letter
    assert_response :success
  end

  test "should update letter" do
    put :update, id: @letter, letter: { content: @letter.content, crypted_password: @letter.crypted_password, email: @letter.email, express: @letter.express, paper_id: @letter.paper_id, receiver_address: @letter.receiver_address, receiver_phone: @letter.receiver_phone, receiver_phone: @letter.receiver_phone, salt: @letter.salt, sender_address: @letter.sender_address, sender_name: @letter.sender_name, sender_phone: @letter.sender_phone, user_id: @letter.user_id }
    assert_redirected_to letter_path(assigns(:letter))
  end

  test "should destroy letter" do
    assert_difference('Letter.count', -1) do
      delete :destroy, id: @letter
    end

    assert_redirected_to letters_path
  end
end
