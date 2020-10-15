class UserMailersController < ApplicationController
  def new
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:document_id])
    @user_name = current_user.name
    @user_mail = current_user.email
    document = Document.find(params[:document_id])
    @images = document.images
  end

  # def create 
  #   UserMailer.
  # end

  private
  def email_params
    params.permit(:send_email, :subject, :message)
  end


end
