class FoldersController < ApplicationController
def index 
    @user_name = current_user.name
    # @folders = Folder.all
    @search = Folder.ransack(params[:q])
    @folders = @search.result

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

  def sort 
    @user_name = current_user.name
    if params[:sort_decs]
      @folders = Folder.all.order("created_at DESC")
    elsif params[:sort_acs]
      @folders = Folder.all.order("created_at ASC")
    elsif params[:name_decs]
      @folders = Folder.all.order("folder_name DESC")
    end
  end


  private
  def document_params
    params.require(:document_folder).permit(:document_tag, :folder_name, images: []).merge(user_id: current_user.id)
  end

  def sort_params
    params.require(:q).permit(:sorts)
  end

end
