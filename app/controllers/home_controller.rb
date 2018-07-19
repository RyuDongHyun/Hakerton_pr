class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :destroy_book
  
  def index
    @crews=[]
    
    current_user.joined_crews.each do |crew|
      if crew.rolls.find_by(is_signed?: "follow")
      @crews.push(crew)
      end
    end
  end
  
  private
  def destroy_book
    Searching.destroy_all
    
  end
end
