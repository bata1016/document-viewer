class DocumentsController < ApplicationController
  def index 
    @user_name = current_user.name
  end

  def new
    @document = Document.new
  end

  def create

  end


  private

  
end
