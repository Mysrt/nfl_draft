class DraftsController < ApplicationController
  def index
    @drafts = Draft.all
  end
  
  def show
    @draft = Draft.find(params[:id])
  end
  
  def new
    @draft = Draft.new
  end
  
  def create
    @draft = Draft.new(params[:draft])
    if @draft.save
      flash[:notice] = "Successfully created draft."
      redirect_to @draft
    else
      render :action => 'new'
    end
  end
  
  def edit
    @draft = Draft.find(params[:id])
  end
  
  def update
    @draft = Draft.find(params[:id])
    if @draft.update_attributes(params[:draft])
      flash[:notice] = "Successfully updated draft."
      redirect_to @draft
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @draft = Draft.find(params[:id])
    @draft.destroy
    flash[:notice] = "Successfully destroyed draft."
    redirect_to drafts_url
  end
end
