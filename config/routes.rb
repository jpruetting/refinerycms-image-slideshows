Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :image_slideshows, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :image_slideshows do
        resources :image_slides, :except => :show do
          collection do
            post :update_positions
          end
        end
        collection do
          post :update_positions
        end
      end
    end
  end

end
