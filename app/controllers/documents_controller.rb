class DocumentsController < ApplicationController
  def index 
    @folders  = Folder.all
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents

  end
  
end
