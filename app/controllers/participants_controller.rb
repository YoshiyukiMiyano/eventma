class ParticipantsController < ApplicationController

  def create
    participant = current_user.participants.create(event_id: params[:event_id])
    redirect_to events_url, notice: "登録しました"
  end

  def destroy
    participant = current_user.participants.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url, notice: "解除しました"
  end
end