class Api::V1::RatingsController < ApplicationController

  def create
    begin
      rating_object = Rating.new(request_params)

      unless rating_object.save
        render json: {status: 'ERROR', message:'Rating on post failed!', data: rating_object.error}, status: :unprocessable_entity
      end

      post = Post.find(request_params[:post_id])
      previous_ratings = post.average_rating * post.rating_numbers
      updated_rating = (previous_ratings + rating_object.rating)/ post.rating_numbers + 1

      post.average_rating = updated_rating
      post.rating_numbers = rating_numbers + 1
      post.save!

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
