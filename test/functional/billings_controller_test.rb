require 'test_helper'

class BillingsControllerTest < ActionController::TestCase
  setup do
    @billing = billings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing" do
    assert_difference('Billing.count') do
      post :create, billing: { amount: @billing.amount, approved_at: @billing.approved_at, letter_id: @billing.letter_id, sender_name: @billing.sender_name, status: @billing.status, status_desc: @billing.status_desc, user_id: @billing.user_id }
    end

    assert_redirected_to billing_path(assigns(:billing))
  end

  test "should show billing" do
    get :show, id: @billing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing
    assert_response :success
  end

  test "should update billing" do
    put :update, id: @billing, billing: { amount: @billing.amount, approved_at: @billing.approved_at, letter_id: @billing.letter_id, sender_name: @billing.sender_name, status: @billing.status, status_desc: @billing.status_desc, user_id: @billing.user_id }
    assert_redirected_to billing_path(assigns(:billing))
  end

  test "should destroy billing" do
    assert_difference('Billing.count', -1) do
      delete :destroy, id: @billing
    end

    assert_redirected_to billings_path
  end
end
