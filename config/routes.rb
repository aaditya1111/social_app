Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :authentication
      resources :feedbacks
      resources :ratings

      resources :posts, only: [:create, :index] do
        collection do

          get 'list_internet_protocols'

        end
      end
    end
  end
end
