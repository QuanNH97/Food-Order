Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  devise_for :users
  resources :restaurants
  resources :users

  # Code tự viết
  get '/restaurants/:restaurant_id/menu', to: 'restaurants#showMenu', as: 'menu'
  post '/restaurants/order', to: 'restaurants#order'

  # Các hoạt động ở đây : load link trang chủ ra , VueJs sẽ gọi đến API để trả về Json
  # gồm danh sách các id,... của nhà hàng . Giao diện Vue sẽ xử lý và gửi form lên đường dẫn generatee-link
  # Từ đó sẽ thêm vào db và trả về 1 link chứa code đc generate ...
  get '/load-list-restaurants', to: 'api#loadListRestaurants'
  post '/restaurants/generate-link', to: 'api#generateLink'
  get '/show-menu/:id', to: 'api#loadMenuFromRestId'
  get '/order', to: 'api#getOrderWithCode'

  get '/theme', to: 'restaurants#theme', as: 'theme'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/EON51/index.html'
  get 'EON51', to: 'static_pages#show', as: 'EON51'
end
# Làm phần đặt món - cho người dùng pick món sau đó hiển thị danh sách món đó ra . Submit để gửi đi
# Dùng modal để hiển thị + Vue để submit - triển khai
# ADmin cần 1 cái chuyển trạng thái cho order
# Thiếu sô lượng món này + gia thằng lol
#