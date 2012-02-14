class CornwallEventsController < ApplicationController
 
  # GET /cornwall_events
  # GET /cornwall_events.json
  def index
    @cornwall_events = CornwallEvent.order(:sequence_no)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cornwall_events }
    end
  end

  # GET /cornwall_events/1
  # GET /cornwall_events/1.json
  def show
    @cornwall_event = CornwallEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cornwall_event }
    end
  end

  # GET /cornwall_events/new
  # GET /cornwall_events/new.json
  def new
    @cornwall_event = CornwallEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cornwall_event }
    end
  end

  # GET /cornwall_events/1/edit
  def edit
    @cornwall_event = CornwallEvent.find(params[:id])
  end

  # POST /cornwall_events
  # POST /cornwall_events.json
  def create
    @cornwall_event = CornwallEvent.new(params[:cornwall_event])

    respond_to do |format|
      if @cornwall_event.save
        format.html { redirect_to @cornwall_event, notice: 'Cornwall event was successfully created.' }
        format.json { render json: @cornwall_event, status: :created, location: @cornwall_event }
      else
        format.html { render action: "new" }
        format.json { render json: @cornwall_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cornwall_events/1
  # PUT /cornwall_events/1.json
  def update
    @cornwall_event = CornwallEvent.find(params[:id])

    respond_to do |format|
      if @cornwall_event.update_attributes(params[:cornwall_event])
        format.html { redirect_to @cornwall_event, notice: 'Cornwall event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cornwall_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cornwall_events/1
  # DELETE /cornwall_events/1.json
  def destroy
    @cornwall_event = CornwallEvent.find(params[:id])
    @cornwall_event.destroy

    respond_to do |format|
      format.html { redirect_to cornwall_events_url }
      format.json { head :ok }
    end
  end


end
