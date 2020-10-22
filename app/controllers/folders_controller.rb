class FoldersController < ApplicationController
  before_action :set_user_name, only: [:index, :search, :sort]
  before_action :set_user
  
  def index 
    @user = current_user
    @folders = @user.folders.all.order("created_at DESC")
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
    @folders = @user.folders.all.order('created_at DESC')
    @documents = SearchDocumentsService.search(params[:keyword], @user)
  end

  def sort 
    if params[:sort_decs]
      @folders = @user.folders.all.order("created_at DESC")
    elsif params[:sort_acs]
      @folders = @user.folders.all.order("created_at ASC")
    elsif params[:name_decs]
      @folders = @user.folders.all.order("folder_name DESC")
    end
  end


  private
  def document_params
    params.require(:document_folder).permit(:document_tag, :folder_name, images: []).merge(user_id: current_user.id)
  end


  def set_user_name
    @user_name = current_user.name
  end

  def set_user
    @user = current_user
  end

end
