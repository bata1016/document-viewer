class DocumentsController < ApplicationController
  before_action :set_folder, only: [:index, :sort]
  before_action :find_folder_id

  def index 
    @document = @folder.documents
    @user_name = current_user.name
  end

  def new 
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.valid?
      @document.save
      redirect_to folder_documents_path(@folder.id)
    else
      render "new"
    end
  end

  def edit
    @document = Document.find(params[:id])
  end


  def update
    if Document.update(document_params)
      return redirect_to folder_documents_path(@folder.id) 
    else
      render "edit"
    end
  end
  
  def destroy
    document = Document.find(params[:id])
    document.destroy
    redirect_to folder_documents_path(@folder.id) 
  end

  def sort
    # @document = @folder.documents
    @user_name = current_user.name
    if params[:sort_decs]
      @document = @folder.documents.order("created_at DESC")
    elsif params[:sort_asc]
      @document = @folder.documents.order("created_at ASC")
    elsif params[:name_decs]
      @document = @folder.documents.order("created_at DESC")
    end
  end

  private

  def document_params
    params.require(:document).permit(:document_tag, images: []).merge(folder_id: params[:folder_id], user_id: current_user.id)
  end

  def set_folder
    @folders  = Folder.includes(:user).order("created_at DESC")
  end

  def find_folder_id
    @folder = Folder.find(params[:folder_id])
  end


end
