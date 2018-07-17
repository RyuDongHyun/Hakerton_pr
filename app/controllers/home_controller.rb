class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @crews=[]
    

    current_user.joined_crews.each do |crew|
      @crews.push(crew)  
    end


  end
end
