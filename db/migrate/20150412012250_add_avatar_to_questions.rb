class AddAvatarToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :avatar_file_name, :string
    add_column :questions, :avatar_content_type, :string
    add_column :questions, :avatar_file_size, :integer
    add_column :questions, :avatar_updated_at, :datetime
  end

def self.down
    remove_column :questions, :avatar_file_name
    remove_column :questions,  :avatar_content_type
    remove_column :questions,  :avatar_file_size
    remove_column :questions, :avatar_updated_at
 end
end
