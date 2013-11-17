Refinery::Core::Engine.routes.append do

  match 'snippets/assign/:id' => 'snippets/snippets#assign'
  match 'snippets/unassign/:id' => 'snippets/snippets#unassign'
  match 'pages_snippets/update_positions' => 'pages_snippets/admin/pages_snippets#update_positions', :as =>'wwwwww'
  
  # Admin routes
  namespace :widgets, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :widgets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
