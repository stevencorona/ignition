class SessionsController < ApplicationController

  layout "session" 
  
  def new
  end
 
  def create
    @auth = request.env['omniauth.auth']['credentials']
    @info = request.env['omniauth.auth']['info']
    
    @user = User.find_or_create_by(email: @info['email'])

    @user.name          = @info['name']
    @user.image         = @info['image']
    @user.access_token  = @auth['token']
    @user.refresh_token = @auth['refresh_token']
    @user.expires_at    = Time.at(@auth['expires_at']).to_datetime

    @user.save

    # Bless this session
    self.current_user = @user

    redirect_to dashboard_path
  end
end
