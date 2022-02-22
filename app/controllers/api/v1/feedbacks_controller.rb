class Api::V1::FeedbacksController < ApplicationController

  def create
    begin
      feedbacks = Feedback.where(owner_id: request_params[:owner_id])

      if  feedbacks.present?
        render json: {
          status: 'SUCCESS', message:'List of feedbacks', total_feedbacks: feedbacks.count, data: feedbacks
        }, status: :ok
      else
        feedback = Feedback.new(request_params)

        unless feedback.save
          render json: {status: 'ERROR', message:'Feedback creation failed!', data: feedback.error}, status: :unprocessable_entity
        end
      end
    rescue => error
      render json: {status: 'ERROR', message:'Feedback creation failed!', data: error}, status: :unprocessable_entity
    end
  end



  private

  def request_params
    params.permit(:comment, :user_id, :post_id, :owner_id)
  end

end
