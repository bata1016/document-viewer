class DocumentsController < ApplicationController
  def index 
    @user_name = current_user.name
  end

  def new
    
  end

  def create

  end
end
