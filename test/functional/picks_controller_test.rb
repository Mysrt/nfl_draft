require 'test_helper'

class PicksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Pick.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Pick.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Pick.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pick_url(assigns(:pick))
  end

  def test_edit
    get :edit, :id => Pick.first
    assert_template 'edit'
  end

  def test_update_invalid
    Pick.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pick.first
    assert_template 'edit'
  end

  def test_update_valid
    Pick.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pick.first
    assert_redirected_to pick_url(assigns(:pick))
  end

  def test_destroy
    pick = Pick.first
    delete :destroy, :id => pick
    assert_redirected_to picks_url
    assert !Pick.exists?(pick.id)
  end
end
