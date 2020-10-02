class SearchDocumentsService
  def self.search(search)
    if search != ""
      Document.where("document_tag LIKE(?)", "%#{search}%")
    else
      Document.all
    end
  end
end