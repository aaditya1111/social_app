class Api::V1::StudentsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :index]

  def create
    begin

      request_params = post_params

      user = User.where(user_name: request_params[:user_name])

      if user.blank?
        validate_user(post_params)

        user = User.create!({
          name: request_params[:name],
          user_name: request_params[:user_name],
          password: request_params[:password],
          mobile: request_params[:mobile]
        })
      end

      post = Post.create!({
        title: request_params[:title],
        content: request_params[:content],
        author_ip: request_params[:author_ip],
        user_id: user.id
      })

      render json: {status: 'SUCCESS', message:"Post created Successfully with title #{post.title}", data: post}, status: :ok

    rescue  => error
      render json: {message: error}
    end
  end


  private

  def post_params
    params.permit(:title, :content, :author_ip, :name, :user_name, :password, :mobile)
  end


  def validate_user(post_params)
      mobile_number_regex = /^[1-9]\d{9}$/
      email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      render json: {error: "Please enter name"}, status: :bad_request if params[:name].blank?
      render json: {error: "Please enter email in right format"}, status: :bad_request if params[:name].blank? || !params[:user_name].match(email_regex)
      puts params[:password].size()
      render json: {error: "Please enter a valid password"}, status: :bad_request if params[:password].blank? || !(params[:password].size() > 7)
      render json: {error: "Please enter valid mobile_number"}, status: :bad_request if params[:mobile].blank? || !params[:mobile].match(mobile_number_regex)
  end
end
