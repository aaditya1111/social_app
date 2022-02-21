class Api::V1::StudentsController < ApplicationController
  skip_before_action :authenticate, only: [:create]


  def create
    begin
      rating_object = Rating.new(request_params)

      unless rating_object.save
        render json: {status: 'ERROR', message:'Rating on post failed!', data: rating_object.rating}, status: :unprocessable_entity
      end

      render json: {status: 'SUCCESS', message:"Post is rated created Successfully with rating #{rating_object.rating}", data: rating_object}, status: :ok
    rescue => error
      render json: {status: 'ERROR', message:'Post creation failed!', data: error}, status: :unprocessable_entity
    end
  end


  private

  def request_params
    params.permit(:post_id, :rating)
  end

end
