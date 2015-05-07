class AddAccessKeyToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :scribd_access_key, :string
  end
end
