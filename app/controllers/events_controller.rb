class EventsController < ApplicationController
    def home
    end

    def show
        @events = Event.all
    end

    def create
        @event = Event.new
        @event.description= params["description"] 
        puts @event.description

        @event.date = params["date"]
        @event.place= params['place']
        @event.save 

        

        redirect_to "/events/show"
    end
end
