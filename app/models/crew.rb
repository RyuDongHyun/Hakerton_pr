class Crew < ActiveRecord::Base
    has_many :rolls
    has_many :users, through: :rolls
    has_many :posts
    
    mount_uploader(:image, PhotoUploader)
end
