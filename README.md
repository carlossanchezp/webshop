Curso-Ruby-On-Rails
===================

Curso RubyOnRails 2012 oficias de aspgems

Las Rutes:
              login GET    /login(.:format)                                 sessions#new
             logout GET    /logout(.:format)                                sessions#destroy
           new_user GET    /signup(.:format)                                users#new
            reviews GET    /reviews(.:format)                               reviews#index
             review GET    /reviews/:id(.:format)                           reviews#show
             review DELETE /reviews/:id(.:format)                           reviews#destroy
    product_reviews GET    /products/:product_id/reviews(.:format)          reviews#index
                    POST   /products/:product_id/reviews(.:format)          reviews#create
 new_product_review GET    /products/:product_id/reviews/new(.:format)      reviews#new
edit_product_review GET    /products/:product_id/reviews/:id/edit(.:format) reviews#edit
     product_review PUT    /products/:product_id/reviews/:id(.:format)      reviews#update
           products GET    /products(.:format)                              products#index
                    POST   /products(.:format)                              products#create
        new_product GET    /products/new(.:format)                          products#new
       edit_product GET    /products/:id/edit(.:format)                     products#edit
            product GET    /products/:id(.:format)                          products#show
                    PUT    /products/:id(.:format)                          products#update
                    DELETE /products/:id(.:format)                          products#destroy
           sessions POST   /sessions(.:format)                              sessions#create
        new_session GET    /sessions/new(.:format)                          sessions#new
              users GET    /users(.:format)                                 users#index
                    POST   /users(.:format)                                 users#create
          edit_user GET    /users/:id/edit(.:format)                        users#edit
               user GET    /users/:id(.:format)                             users#show
                    PUT    /users/:id(.:format)                             users#update
                    DELETE /users/:id(.:format)                             users#destroy
               root        /                                                products#index

