Rails.application.routes.draw do

  get '/', to: 'parties#index'
  post '/parties/new', to: 'parties#create'
  post '/:id/remove', to: 'parties#remove_from_list'
  post '/:id/text', to: 'parties#text'
  get '/stats', to: 'parties#stats'

end
