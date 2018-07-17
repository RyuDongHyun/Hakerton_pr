class Roll < ActiveRecord::Base
  belongs_to :crew
  belongs_to :user
end
