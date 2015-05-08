# == Schema Information
#
# Table name: papers
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  author_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file              :string(255)
#  demo              :string(255)
#  scribd_doc_id     :string(255)
#  scribd_access_key :string(255)
#

require 'test_helper'

class PaperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
