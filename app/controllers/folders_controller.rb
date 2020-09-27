class FoldersController < ApplicationController
def index 
    @user_name = current_user.name
    @folders = Folder.all

  end

  def new
    @document = DocumentFolder.new
  end

  def create
    @document = DocumentFolder.new(document_params)
    if @document.valid?
      binding.pry
      @document.save
      return redirect_to root_path  
    else
      render "new"
    end
  end


  private
  def document_params
    params.require(:document_folder).permit(:document_name, :folder_name, images:[]).merge(user_id: current_user.id)
  end

end
