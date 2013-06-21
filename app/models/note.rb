class Note < ActiveRecord::Base
  belongs_to :user

  attr_accessible :content, :title, :user_id

  after_initialize :init

  def init
    self.title ||= 'Untitled Note'
    self.content ||= 'Content'
  end
end
