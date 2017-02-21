require 'test_helper'

class BadguestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badguest = badguests(:one)
  end

  test "should get index" do
    get badguests_url
    assert_response :success
  end

  test "should get new" do
    get new_badguest_url
    assert_response :success
  end

  test "should create badguest" do
    assert_difference('Badguest.count') do
      post badguests_url, params: { badguest: { desc: @badguest.desc, phone: @badguest.phone } }
    end

    assert_redirected_to badguest_url(Badguest.last)
  end

  test "should show badguest" do
    get badguest_url(@badguest)
    assert_response :success
  end

  test "should get edit" do
    get edit_badguest_url(@badguest)
    assert_response :success
  end

  test "should update badguest" do
    patch badguest_url(@badguest), params: { badguest: { desc: @badguest.desc, phone: @badguest.phone } }
    assert_redirected_to badguest_url(@badguest)
  end

  test "should destroy badguest" do
    assert_difference('Badguest.count', -1) do
      delete badguest_url(@badguest)
    end

    assert_redirected_to badguests_url
  end
end
