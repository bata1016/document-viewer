class FoldersController < ApplicationController
def index 
    @user_name = current_user.name
    @folders = Folder.all
    # @folder = Folder.find(params[:id])

  end

  def new
    @document = DocumentFolder.new
  end

  def create
    @document = DocumentFolder.new(document_params)
    if @document.valid?
      @document.save
      return redirect_to root_path  
    else
      render "new"
    end
  end

  def destroy
    folder = Folder.find(params[:id])
    folder.destroy
    redirect_to root_path
  end

  def search
    @folders = Folder.all
    @documents = SearchDocumentsService.search(params[:keyword])
    @user_name = current_user.name
  end


  private
  def document_params
    params.require(:document_folder).permit(:document_tag, :folder_name, images:[]).merge(user_id: current_user.id)
  end

end
