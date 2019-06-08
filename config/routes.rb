Rails.application.routes.draw do
  #Frontend routes
  get '/survey/:id/:score', to:'survey#new'
  get '/survey/:id', to:'survey#new'
  post '/survey/', to:'survey#updateResponse'

  namespace :admin do 
    #Survey controller
    resources :survey, only: %i[index new create destroy show]
    get '/question/:id/shift/:f_id/:where', to:'survey#shiftFeedbackPosition'
    put '/survey/create-response/:id', to: 'survey#createResponse'

    #Questions controller
    resources :question, only: %i[new create edit update destroy]

    #Answers controller
    resources :survey_answer, only: :show
  end
end
