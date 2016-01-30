class InvitationsController < ApplicationController
  
  def create
    event = Event.find(params[:invitation][:attended_event_id])
    current_user.invitations.create(attended_event_id: event.id, status: nil)
    flash[:success] = "You are now attending the event"
    redirect_to event
  end
  
end
