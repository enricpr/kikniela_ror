require 'test_helper'

class BetsControllerTest < ActionController::TestCase
  setup do
    @bet = bets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet" do
    assert_difference('Bet.count') do
      post :create, bet: { hits: @bet.hits, tip10: @bet.tip10, tip11: @bet.tip11, tip12: @bet.tip12, tip13: @bet.tip13, tip14: @bet.tip14, tip15: @bet.tip15, tip1: @bet.tip1, tip2: @bet.tip2, tip3: @bet.tip3, tip4: @bet.tip4, tip5: @bet.tip5, tip6: @bet.tip6, tip7: @bet.tip7, tip8: @bet.tip8, tip9: @bet.tip9, user_id: @bet.user_id, week: @bet.week }
    end

    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should show bet" do
    get :show, id: @bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet
    assert_response :success
  end

  test "should update bet" do
    patch :update, id: @bet, bet: { hits: @bet.hits, tip10: @bet.tip10, tip11: @bet.tip11, tip12: @bet.tip12, tip13: @bet.tip13, tip14: @bet.tip14, tip15: @bet.tip15, tip1: @bet.tip1, tip2: @bet.tip2, tip3: @bet.tip3, tip4: @bet.tip4, tip5: @bet.tip5, tip6: @bet.tip6, tip7: @bet.tip7, tip8: @bet.tip8, tip9: @bet.tip9, user_id: @bet.user_id, week: @bet.week }
    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should destroy bet" do
    assert_difference('Bet.count', -1) do
      delete :destroy, id: @bet
    end

    assert_redirected_to bets_path
  end
end
