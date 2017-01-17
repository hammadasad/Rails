class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by email: sessions_params[:email]

    if u && u.authenticate(sessions_params[:password])
      flash[:notice] = 'Successfully logged in'
      redirect_to root_url
    else
      flash[:alert] = 'Invalid Credentials!'
      render :new
    end
  end

  def destroy
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
