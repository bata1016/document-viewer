class DocumentsController < ApplicationController
  def index 
    @user_name = current_user.name
  end

  def new
    @document = DocumentFolder.new
  end

  def create
    @document = DocumentFolder.new(document_params)
    @folder = Folder.new

    if @document.valid?
      @document.save
      binding.pry
      return redirect_to root_path   
    else
      render "new"
    end
  end


  private
  def document_params
    params.require(:document_folder).permit(:document_name, :folder_name, :image).merge(user_id: current_user.id)
  end
  
end
