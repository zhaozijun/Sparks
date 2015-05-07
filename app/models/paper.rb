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

class Paper < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  attr_accessible :title, :author_id, :file, :demo, :scribd_doc_id, :scribd_access_key, :remove_file, :remove_demo

  mount_uploader :file, FileUploader
  mount_uploader :demo, DemoUploader
  
  def scribd_url
    Scribd::Document.find(self.scribd_doc_id).download_url
    #"http://www.scribd.com/word/full/#{self.scribd_doc_id}?access_key=#{self.scribd_access_key}"
  end
end
