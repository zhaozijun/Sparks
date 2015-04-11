class AddFileToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :file, :string
  end
end
