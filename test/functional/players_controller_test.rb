require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Players.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Players.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Players.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to players_url(assigns(:players))
  end
  
  def test_edit
    get :edit, :id => Players.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Players.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Players.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Players.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Players.first
    assert_redirected_to players_url(assigns(:players))
  end
  
  def test_destroy
    players = Players.first
    delete :destroy, :id => players
    assert_redirected_to players_url
    assert !Players.exists?(players.id)
  end
end
