# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  anwsertext :text
#  paper_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :paper
  attr_accessible :content, :paper_id, :avatar, :anwsertext 
  validates :content, presence: true
  validates :avatar,
     attachment_content_type: {content_type: /\Aimage\/.*\z/ }
  has_attached_file :avatar, :styles => {:medium => "300*300>",:thumb => "100*100>"}
end
