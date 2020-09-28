class DocumentsController < ApplicationController
  def index 
    @folders  = Folder.all
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents

  end

  def edit
    @document = Document.find(params[:id])
    @folder = Folder.find(params[:folder_id])

  end


  def update
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:id])
    # binding.pry
    @document.update(document_params)
    binding.pry
    if @document.valid?
      return redirect_to folder_documents_path(@folder.id) 
    else
      render "edit"
    end
  end
  
  def destroy
    document = Document.find(params[:id])
    document.destroy
  end


  private

  def document_params
    params.require(:folder).permit(:document_name, images: []).merge(user_id: current_user.id, folder_id: @folder.id)
  end
end
