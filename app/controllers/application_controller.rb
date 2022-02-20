class ApplicationController < ActionController::API
  before_action :authenticate
  attr_reader :current_token, :current_user


  private

  def current_token
    @token || nil
  end

  def current_user
    @current_user = User.find($redis.hget(current_token, :student_id)) if current_token
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

#validating the token entered by user
  def authenticate_token
    if request.headers["Authorization"].present?
      @token = request.headers["Authorization"].split(" ").last
      if AuthToken.valid?(@token) && $redis.ttl(@token) > 0
        $redis.expire(@token, 10.days.to_i)

      else
        raise "My Auth error, Token is expired"
      end
    end

    @token
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render nothing: true, status: :unauthorized, content_type: 'application/json'
  end
end
