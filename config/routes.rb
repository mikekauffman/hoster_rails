Rails.application.routes.draw do

  get '/', to: 'parties#index'
  post '/parties/new', to: 'parties#create'
  get '/:id/remove', to: 'parties#remove_from_list'
  get '/:id/text', to: 'parties#text'
  get '/stats', to: 'parties#stats'

end
