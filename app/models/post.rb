class Post < ActiveRecord::Base
    belongs_to :crew
    
    mount_uploader :image, PhotoUploader
end
