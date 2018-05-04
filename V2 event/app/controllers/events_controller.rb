require 'date'

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    if session[:user]
      @event = Event.find(params['id'])
      @creator = User.find(@event.creator_id)
      event_attending = EventAttendee.where(event_id: params[:id])
      @attendees = []
      event_attending.each do |a|
        @attendees.push(User.find(a.attendee_id))
      end
    else
      flash[:alert] = "Veuillez vous connecter svp!"
      redirect_to home_path
    end
  end

  def new
  end

  def create
    p params[:event][:description]
    event = Event.create(description: params[:event][:description], 
      place: params[:event][:place],
      date: Date.parse(params[:event][:date]))
      event.creator = User.find(session[:user]['id'])
      
      if event.valid?
        event.save
        flash[:success] = "Évènement créer avec succès!"
        redirect_to current_user_path(event.id)
    else
      flash[:error] = "Champ invalide!"
      redirect_to new_event_path
    end
  end

  def suscribe
    attending = EventAttendee.new
    event = Event.find(params[:id])
    attending.event = event
    attending.attendee = User.find(session[:user]['id'])
    if attending.valid?
      attending.save
      redirect_to event_show_path(event.id)
    else
      redirect_to home_path
    end
  end

  def invite
    u = User.all
    @potos = []
    @event = Event.find(params[:id])
    u.each do |x|
      @potos.push(x.name)
    end
  end
  def share_invite
    attending = EventAttendee.new
    attending.event = Event.find(params['event'])
    attending.attendee = User.find_by(name: params['potos'])
    if attending.valid?
      attending.save
      redirect_to event_show_path(params['event'])
    end
  end
end
