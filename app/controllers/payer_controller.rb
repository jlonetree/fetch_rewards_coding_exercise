class PayerController < ApplicationController
    def points_balance
        payer_balances = {}

        Payer.all.each { | payer | payer_balances.store(payer[:payer], payer[:points]) }

        render :json => payer_balances
    end
end
