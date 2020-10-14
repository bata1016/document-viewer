class UserMailersController < ApplicationController
  def new
    @folder = Folder.find(params[:folder_id])
    @document = Document.find(params[:document_id])
  end
end
