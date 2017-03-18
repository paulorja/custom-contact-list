Rails.application.routes.draw do

  resources :fields
  resources :contacts
  devise_for :users
  root 'visitors#index'

  get 'fields/:id/options/new', to: 'combo_box_options#new', as: :new_combobox_option
  match 'fields/:id/options/new', to: 'combo_box_options#create', as: :create_combobox_option, via: :post
  get 'fields/:id/options/:option_id/edit', to: 'combo_box_options#edit', as: :edit_combobox_option
  match 'fields/:id/options/:option_id/edit', to: 'combo_box_options#update', as: :update_combobox_option, via: :post
  match 'fields/:id/options/:option_id/destroy', to: 'combo_box_options#destroy', as: :destroy_combobox_option, via: :delete

end
