require 'test_helper'

class BarrelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barrel = barrels(:one)
  end

  test "should get index" do
    get barrels_url
    assert_response :success
  end

  test "should get new" do
    get new_barrel_url
    assert_response :success
  end

  test "should create barrel" do
    assert_difference('Barrel.count') do
      post barrels_url, params: { barrel: { alcohol: @barrel.alcohol, comments: @barrel.comments, content: @barrel.content, description: @barrel.description, elaboration_date: @barrel.elaboration_date, expiration_date: @barrel.expiration_date, ibu: @barrel.ibu, ingredients: @barrel.ingredients, lot: @barrel.lot, number: @barrel.number, rnpa: @barrel.rnpa, type: @barrel.type, type_details: @barrel.type_details } }
    end

    assert_redirected_to barrel_url(Barrel.last)
  end

  test "should show barrel" do
    get barrel_url(@barrel)
    assert_response :success
  end

  test "should get edit" do
    get edit_barrel_url(@barrel)
    assert_response :success
  end

  test "should update barrel" do
    patch barrel_url(@barrel), params: { barrel: { alcohol: @barrel.alcohol, comments: @barrel.comments, content: @barrel.content, description: @barrel.description, elaboration_date: @barrel.elaboration_date, expiration_date: @barrel.expiration_date, ibu: @barrel.ibu, ingredients: @barrel.ingredients, lot: @barrel.lot, number: @barrel.number, rnpa: @barrel.rnpa, type: @barrel.type, type_details: @barrel.type_details } }
    assert_redirected_to barrel_url(@barrel)
  end

  test "should destroy barrel" do
    assert_difference('Barrel.count', -1) do
      delete barrel_url(@barrel)
    end

    assert_redirected_to barrels_url
  end
end
