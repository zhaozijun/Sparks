# == Schema Information
#
# Table name: questions
#
#  id                  :integer          not null, primary key
#  content             :text
#  answertext          :text
#  paper_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  tag                 :string(255)
#  image               :string(255)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
