class PayerController < ApplicationController
    def points_balance
        payer_balances = {}

        render :json => payer_balances
    end
end
