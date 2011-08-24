class LogsController < ApplicationController
  require 'socket'
  
  load_and_authorize_resource
  before_filter :require_user, :only => [:edit, :update, :destroy, :admin]
  helper LogsHelper
  
  def index
    @logs = Log.all(:conditions => ["updated_at between ? and ?", Date.today, Date.today+1], :order => "created_at DESC")
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
    @log = Log.new(params[:log])
    # Not sure if the following should be local_ip or request.remote_ip
    @log.ip = local_ip
    @logs = Log.all(:conditions => ["updated_at between ? and ?", Date.today, Date.today+1], :order => "created_at DESC")

    if @log.save
      flash[:notice] = 'Welcome to the OCT Help Desk!'
      respond_to do |format|
        format.html { redirect_to root_url }
      end
    else
      render :action => "index"
    end
  end

  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        flash[:notice] = 'Log was successfully updated.'
        format.html { redirect_to root_url }
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
  
  def admin
    if !params[:find_dates].blank?
      @start_date = valid_date(:find_dates,'start_date')
      @end_date = valid_date(:find_dates,'end_date')
    else
      if params[:start_date].blank?
        @start_date = Date.today
        @end_date = Date.today+1
      else
        @start_date = params[:start_date]
        @end_date = params[:end_date]
      end
    end

    @logs = Log.all(:conditions => ["updated_at between ? and ?", @start_date, @end_date], :order => "created_at DESC")

    respond_to do |format|
      format.html { render :action => 'admin', :layout => 'admin' }
      format.csv { render :csv => @logs }
    end
  end

  private
    def valid_date(object,attribute)
      Date::civil(params[object][attribute + '(1i)'].to_i,   
                  params[object][attribute + '(2i)'].to_i, 
                  params[object][attribute + '(3i)'].to_i)
    end
    
    def local_ip
      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

      UDPSocket.open do |s|
        s.connect '64.233.187.99', 1
        s.addr.last
      end
    ensure
      Socket.do_not_reverse_lookup = orig
    end
    
end
