Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :image_slideshows do
    resources :image_slideshows, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :image_slideshows, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :image_slideshows, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
