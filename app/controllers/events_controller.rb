class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :show]

  # GET /events
  # GET /events.json
  def index
#    @events = Event.all
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order("event_at ASC")
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @events = Event.all
    @participant = current_user.participants.find_by(event_id: @event.id)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'イベントを登録しました' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'イベントを更新しました' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'イベントを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :content, :image, :organizer_id, :event_at, :place, :eventend_at, :user_id)
    end

    def require_login
    unless logged_in?
      flash[:error] = "ログインが必要です"
      redirect_to new_session_url # halts request cycle
    end
  end

end
