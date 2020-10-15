class UserMailersController < ApplicationController
  def new
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:document_id])
    @user_name = current_user.name
    @user_mail = current_user.email
    document = Document.find(params[:document_id])
    @images = document.images
  end

  def create 
    user_mail = current_user.email
    document = Document.find(params[:document_id])
    images = document.images
    binding.pry
    if UserMailer.send_email(email_params, user_mail, images).deliver_now
      redirect_to root_path
    else
      render :new
    end
    
  end

  private
  def email_params
    params.permit(:send_email, :subject, :message)
  end

end
