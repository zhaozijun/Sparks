class Fixquesion < ActiveRecord::Migration

 def self.up
    rename_column :questions, :anwsertext, :answertext
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end


