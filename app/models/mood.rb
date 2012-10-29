class Mood < ActiveRecord::Base
  has_many :sub_moods, :dependent => :destroy
  
  attr_accessible :description, :mood_picture, :name
  
  mount_uploader :mood_picture, MoodPictureUploader
  

  
  validates :name, :presence => true
  validates_format_of :mood_picture, :with => %r{\.(png|jpg|jpeg|bmp)$}i, :message => "file format doesn't match"
end
