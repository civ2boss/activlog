class LogsController < ApplicationController
  def index
    @logs = Log.all
    @log = Log.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @log = Log.find(params[:id])
  end

  def create
    @log = Log.new(params[:log])

    respond_to do |format|
      if @log.save
        flash[:notice] = 'Log was successfully created.'
        format.html { redirect_to(@log) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        flash[:notice] = 'Log was successfully updated.'
        format.html { redirect_to(@log) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to(logs_url) }
    end
  end
end
