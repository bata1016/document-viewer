class SearchDocumentsService
  def self.search(search, user)
    @user = user
    if search != ""
      @user.documents.where("document_tag LIKE(?)", "%#{search}%").order("created_at DESC")
    else
      @user.documents.all.order('created_at DESC')
    end
  end
end