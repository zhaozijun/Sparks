# == Schema Information
#
# Table name: papers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  file       :string(255)
#  demo       :string(255)
#

class Paper < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  attr_accessible :title, :author_id, :file, :demo

  mount_uploader :file, FileUploader
  mount_uploader :demo, DemoUploader
end
