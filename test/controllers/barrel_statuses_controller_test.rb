require 'test_helper'

class BarrelStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barrel_status = barrel_statuses(:one)
  end

  test "should get index" do
    get barrel_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_barrel_status_url
    assert_response :success
  end

  test "should create barrel_status" do
    assert_difference('BarrelStatus.count') do
      post barrel_statuses_url, params: { barrel_status: { state: @barrel_status.state, temperature: @barrel_status.temperature, temperature_tstmp: @barrel_status.temperature_tstmp } }
    end

    assert_redirected_to barrel_status_url(BarrelStatus.last)
  end

  test "should show barrel_status" do
    get barrel_status_url(@barrel_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_barrel_status_url(@barrel_status)
    assert_response :success
  end

  test "should update barrel_status" do
    patch barrel_status_url(@barrel_status), params: { barrel_status: { state: @barrel_status.state, temperature: @barrel_status.temperature, temperature_tstmp: @barrel_status.temperature_tstmp } }
    assert_redirected_to barrel_status_url(@barrel_status)
  end

  test "should destroy barrel_status" do
    assert_difference('BarrelStatus.count', -1) do
      delete barrel_status_url(@barrel_status)
    end

    assert_redirected_to barrel_statuses_url
  end
end
