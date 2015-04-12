class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :id
      t.text :content
      t.text :anwsertext
      t.references :paper

      t.timestamps
    end
    add_index :questions, :paper_id
  end
end
