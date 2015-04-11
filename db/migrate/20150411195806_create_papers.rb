class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.references :author

      t.timestamps
    end
    add_index :papers, :author_id
  end
end
