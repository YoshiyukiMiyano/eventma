class SessionsController < ApplicationController
  def new
  end
  
  def create
  user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password_digest])
      session[:user_id] = user.id
      redirect_to events_path(user.id)
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end
