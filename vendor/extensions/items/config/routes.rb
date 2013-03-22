Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :items do
    resources :items, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :items, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :items, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
