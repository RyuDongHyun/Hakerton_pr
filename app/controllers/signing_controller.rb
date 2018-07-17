class SigningController < ApplicationController
  def sign_up
    unless Crew.find(params[:id]).users.find_by(current_user.id)
      Crew.find(params[:id]).users.push(current_user)
    end
      current_user.rolls.find_by(crew_id: params[:id]).update(is_signed?: "sign_ing")
      @result = current_user.rolls.find_by(crew_id: params[:id]).is_signed?
  end
  
  def follow
    Crew.find(params[:id]).users.push(current_user)
    #current_user.joined_crews.find(params[:id]).update(is_signed?: true)
    
    
    redirect_to root_path
  end
  
  def unfollow
    Crew.find(params[:id]).users.delete(current_user)
    redirect_to root_path
  end
  
  def ok
    current_user.crews.each do |crew|
      if crew.rolls.find_by(user_id: params[:id])
        crew.rolls.find_by(user_id: params[:id]).update(is_signed?: "ok")
      end
    end
  end
end
