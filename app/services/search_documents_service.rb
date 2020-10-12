class SearchDocumentsService
  def self.search(search)
    if search != ""
      Document.where("document_tag LIKE(?)", "%#{search}%").order("created_at DESC")
    else
      Document.all.order('created_at DESC')
    end
  end
end