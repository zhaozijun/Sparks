class AddDemoToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :demo, :string
  end
end
