Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :feedbacks
      resources :ratings

      resources :posts, only: [:create, :index] do
        member do

          get 'list_internet_protocols'

        end
      end
    end
  end
end
