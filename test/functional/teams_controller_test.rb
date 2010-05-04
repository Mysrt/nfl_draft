require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Teams.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Teams.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Teams.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to teams_url(assigns(:teams))
  end
  
  def test_edit
    get :edit, :id => Teams.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Teams.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Teams.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Teams.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Teams.first
    assert_redirected_to teams_url(assigns(:teams))
  end
  
  def test_destroy
    teams = Teams.first
    delete :destroy, :id => teams
    assert_redirected_to teams_url
    assert !Teams.exists?(teams.id)
  end
end
