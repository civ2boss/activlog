class LogsController < ApplicationController
  def index
    @logs = Log.all(:conditions => ["updated_at between ? and ?", Date.today, Date.today+1], :order => "updated_at DESC")
    @log = Log.new
    
    respond_to do |format|
      format.html
      format.csv { render :csv => @logs }
    end
  end

  def new
    @log = Log.new
  end

  def edit
    @log = Log.find(params[:id])
  end

  def create
    @logs = Log.all(:conditions => ["updated_at between ? and ?", Date.today, Date.today+1], :order => "updated_at DESC")
    @log = Log.new(params[:log])

    if @log.save
      flash[:notice] = 'Welcome to the OCT Help Desk!'
      redirect_to root_url
    else
      render :action => "index"
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
