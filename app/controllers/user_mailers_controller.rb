class UserMailersController < ApplicationController
  def new
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:document_id])
    @user_name = current_user.name
    @user_mail = current_user.email
    document = Document.find(params[:document_id])
    @images = document.images
    @email = Email.new
  end

  def create 
    user_mail = current_user.email
    @user = current_user
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:document_id])
    @email = Email.new(email_params)
    binding.pry
    images = @document.images
    # binding.pry
    if UserMailer.send_email(@email, user_mail, images).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def email_params
    params.permit(:send_email, :subject, :message).merge(user_id: @user.id, folder_id: @folder.id, document_id: @document.id)
  end
end
