class UserController < ApplicationController
  def new
  end

  def create
    user = User.create(name: params[:user][:name].downcase)
    p user
    if user.valid?
      user.save
      session[:user] = user
      flash[:success] = "Inscris avec succès!"
      redirect_to home_path
    else
      flash[:error] = "Nom invalide!"
      redirect_to signup_path
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
      @event_attended = EventAttendee.where(attendee_id: params['id'])
      @events = []
      @event_attended.each do |e|
        @events.push(Event.find(e.event_id))
      end
    else
      redirect_to new_event_path
    end

    event_attending = EventAttendee.where(attendee_id: params[:id])
    @attendees = []
    event_attending.each do |a|
      @attendees.push(User.find(a.attendee_id))
    end
  end
end
