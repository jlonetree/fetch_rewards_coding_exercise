class TransactionController < ApplicationController
    def add_transaction
        Transaction.create(transaction_params)
    end

    private

    def transaction_params
       params.require(:transaction).permit(:payer, :points, :timestamp) 
    end
end
