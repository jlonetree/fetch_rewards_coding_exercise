Rails.application.routes.draw do

  root 'transaction#add_transaction'
  get 'points_balance', to 'payer#points_balance'
  get 'spend', to 'user#spend'

end
