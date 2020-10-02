class DocumentsController < ApplicationController
  def index 
    @folders  = Folder.all
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents

  end

  def new 
    @folder = Folder.find(params[:folder_id])
    @document = Document.new
  end

  def create
    @folder = Folder.find(params[:folder_id])
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
    @folder = Folder.find(params[:folder_id])

  end


  def update
    @folder = Folder.find(params[:folder_id])
    if Document.update(document_params)
      return redirect_to folder_documents_path(@folder.id) 
    else
      render "edit"
    end
  end
  
  def destroy
    @folder = Folder.find(params[:folder_id])
    document = Document.find(params[:id])
    document.destroy
    redirect_to folder_documents_path(@folder.id) 
  end

  private

  def document_params
    params.require(:document).permit(:document_tag, images: []).merge(folder_id: params[:folder_id], user_id: current_user.id)
  end
end
