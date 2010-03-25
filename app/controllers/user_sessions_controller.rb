class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to admin_url
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
    
    @logs = Log.all(:conditions => ["updated_at between ? and ?", @start_date, @end_date], :order => "updated_at DESC")
    
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
end
