require 'test_helper'

class PicksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Picks.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Picks.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Picks.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to picks_url(assigns(:picks))
  end
  
  def test_edit
    get :edit, :id => Picks.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Picks.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Picks.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Picks.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Picks.first
    assert_redirected_to picks_url(assigns(:picks))
  end
  
  def test_destroy
    picks = Picks.first
    delete :destroy, :id => picks
    assert_redirected_to picks_url
    assert !Picks.exists?(picks.id)
  end
end
