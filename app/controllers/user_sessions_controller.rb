class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
  
  def admin
    @logs = Log.all(:conditions => ["updated_at between ? and ?", Date.today, Date.today+1], :order => "updated_at DESC")
  end
  
  def find_dates
    @start_date = Date::civil(params[:find_dates]['start_date(1i)'].to_i, params[:find_dates]['start_date(2i)'].to_i, params[:find_dates]['start_date(3i)'].to_i)
    @end_date = Date::civil(params[:find_dates]["end_date(1i)"].to_i, params[:find_dates]["end_date(2i)"].to_i, params[:find_dates]["end_date(3i)"].to_i)
    @logs = Log.all(:conditions => ["updated_at between ? and ?", @start_date, @end_date], :order => "updated_at DESC")
    respond_to do |format|
      format.html { render :action => 'admin' }
      format.csv { render :csv => @logs }
    end
  end

end
