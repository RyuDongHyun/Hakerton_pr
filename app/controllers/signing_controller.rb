class SigningController < ApplicationController
  def sign_up
    unless Crew.find(params[:id]).rolls.find_by(user_id: current_user.id)
      Crew.find(params[:id]).users.push(current_user)
    end
    current_user.rolls.find_by(crew_id: params[:id]).update(is_signed?: "sign_ing")
    @result = current_user.rolls.find_by(crew_id: params[:id]).is_signed?
  end
  
  def follow
    unless Crew.find(params[:id]).rolls.find_by(user_id: current_user.id)
      Crew.find(params[:id]).users.push(current_user)
    end
    current_user.rolls.find_by(crew_id: params[:id]).update(is_signed?: "follow")
    
    
    redirect_to root_path
  end
  
  def unfollow
    unless Crew.find(params[:id]).rolls.find_by(user_id: current_user.id).is_signed? =="admin"
      Crew.find(params[:id]).users.delete(current_user)
    end
    redirect_to root_path
  end
  
  def ok
    crew = Crew.find(params[:crew_id])
    if crew.rolls.find_by(user_id: params[:user_id])
        crew.rolls.find_by(user_id: params[:user_id]).update(is_signed?: "ok")
    end
  end
end
