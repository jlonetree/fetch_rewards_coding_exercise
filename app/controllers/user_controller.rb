class UserController < ApplicationController
    def spend
        points = 5000
        payer = Payer.all
        transactions = Transaction.all
        transaction_total, payer_points_total = 0

        transactions = transactions.sort_by{ | transaction | transaction[:timestamp] }

        transactions.map do | transaction |
            while points > transaction_total
                transaction_total += transaction[:points]
                if transaction[:payer] == payer[:payer] && transaction_total < points
                    payer[:points] -= transaction[:points]
                else
                    final_amount = transaction_total - points
                    payer[:points] = payer[:points] - transaction[:points] + final_amount
                end
            end
        end
        # points spent must be lower than transaction total
        # points will be displayed as negative as the user is spending those payer's points
        # i.e. { payer: foo, points: -100 } aka: add to payer array of hashes
    end
end
