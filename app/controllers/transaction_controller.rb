class TransactionController < ApplicationController
    def add_transaction
        payer_name = ["DANNON", "UNILEVER" ,"MILLER COORS"].sample
        payer_points = [1..10000].sample
        payer_timestamp = DateTime.now()

        render :json => Transaction.create(payer: payer_name, points: payer_points, timestamp: payer_timestamp)
    end
end
