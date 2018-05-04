class SessionsController < ApplicationController
  def new
  end

  def show
    if session[:user]
      @events = Event.where(creator_id: session[:user]['id'])
    else
      redirect_to new_event_path
    end
  end

  def create
    @user = User.find_by(name: params['session']['name'].downcase)
    p @user
    if @user != nil
      session[:user] = @user
      flash[:success] = "Bonjour #{@user.name}!"
      redirect_to home_path
    else
      flash[:error] = "#{params['session']['name']} n'est pas encore inscris!"
      redirect_to action: 'new'
    end
  end

  def destroy
    session.delete :user
    redirect_to home_path
  end
end
