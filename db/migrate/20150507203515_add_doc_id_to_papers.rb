class AddDocIdToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :scribd_doc_id, :string
  end
end
