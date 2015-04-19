# == Schema Information
#
# Table name: questions
#
#  id                  :integer          not null, primary key
#  content             :text
#  anwsertext          :text
#  paper_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  tag                 :string(255)
#

class Question < ActiveRecord::Base
  belongs_to :paper
  attr_accessible :content, :paper_id, :avatar, :answertext,:tag 
  validates :content, presence: true
  validates :avatar,
     attachment_content_type: {content_type: /\Aimage\/.*\z/ }
  has_attached_file :avatar, :styles => {:medium => "300*300>",:thumb => "100*100>",:show => "500*500>"}
end
