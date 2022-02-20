class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: :create

# user login authentication api
  def create
    if user = Session.authenticate(params[:email], params[:password])
      token = AuthToken.issue(user_id: user.id)
      $redis.hset(token, 'user_id', user.id)
      $redis.expire(token, 10.days.to_i)
      render json: {user: user, token: token}
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

#user logout api
  def logout
    $redis.del(current_token)
    render json: {message: 'user is Logged out successfully'}, status: :ok
  end
end
