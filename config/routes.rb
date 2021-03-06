# == Route Map
#
#                       root        /                                              papers#userindex
#        paper_userpapershow GET    /papers/:id(.:format)                          papers#userpapershow
# question_userquestionindex GET    /papers/:paper_id/userquestionindex(.:format)  questions#userquestionindex
#  question_userquestionshow GET    /papers/:paper_id/userquestions/:id(.:format)  questions#userquestionshow
#         new_author_session GET    /accounts/sign_in(.:format)                    devise/sessions#new
#             author_session POST   /accounts/sign_in(.:format)                    devise/sessions#create
#     destroy_author_session DELETE /accounts/sign_out(.:format)                   devise/sessions#destroy
#            author_password POST   /accounts/password(.:format)                   devise/passwords#create
#        new_author_password GET    /accounts/password/new(.:format)               devise/passwords#new
#       edit_author_password GET    /accounts/password/edit(.:format)              devise/passwords#edit
#                            PUT    /accounts/password(.:format)                   devise/passwords#update
# cancel_author_registration GET    /accounts/cancel(.:format)                     devise/registrations#cancel
#        author_registration POST   /accounts(.:format)                            devise/registrations#create
#    new_author_registration GET    /accounts/sign_up(.:format)                    devise/registrations#new
#   edit_author_registration GET    /accounts/edit(.:format)                       devise/registrations#edit
#                            PUT    /accounts(.:format)                            devise/registrations#update
#                            DELETE /accounts(.:format)                            devise/registrations#destroy
#              author_papers GET    /authors/:author_id/papers(.:format)           papers#index
#                            POST   /authors/:author_id/papers(.:format)           papers#create
#           new_author_paper GET    /authors/:author_id/papers/new(.:format)       papers#new
#          edit_author_paper GET    /authors/:author_id/papers/:id/edit(.:format)  papers#edit
#               author_paper GET    /authors/:author_id/papers/:id(.:format)       papers#show
#                            PUT    /authors/:author_id/papers/:id(.:format)       papers#update
#                            DELETE /authors/:author_id/papers/:id(.:format)       papers#destroy
#            paper_questions GET    /papers/:paper_id/questions(.:format)          questions#index
#                            POST   /papers/:paper_id/questions(.:format)          questions#create
#         new_paper_question GET    /papers/:paper_id/questions/new(.:format)      questions#new
#        edit_paper_question GET    /papers/:paper_id/questions/:id/edit(.:format) questions#edit
#             paper_question GET    /papers/:paper_id/questions/:id(.:format)      questions#show
#                            PUT    /papers/:paper_id/questions/:id(.:format)      questions#update
#                            DELETE /papers/:paper_id/questions/:id(.:format)      questions#destroy
#

SPARKs::Application.routes.draw do
  
  root :to => 'papers#userindex'
  
  get 'papers/:id' => 'papers#userpapershow', :as => :paper_userpapershow
  get 'papers/:paper_id/userquestionindex' => 'questions#userquestionindex', :as => :question_userquestionindex
  get 'papers/:paper_id/userquestions/:id' => 'questions#userquestionshow', :as => :question_userquestionshow
  get 'papers/:paper_id/answer/:id' => 'questions#answer', :as => :question_answer
  
  devise_for :authors, :path => "accounts"
  
  resources :authors, :except => [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :papers
  end
  
  resources :papers, :except => [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :questions
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
