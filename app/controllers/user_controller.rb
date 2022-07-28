class UserController < ApplicationController
    def spend
        user = User.find_by(params[:id])
        transactions = Transaction.all.sort_by{ | transaction | transaction[:timestamp] }
        transaction_total = 0
        
        transactions.each do | transaction |
            payer = Payer.find_by(payer: transaction[:payer])
            if user[:points] > transaction_total
                transaction_total += transaction[:points]
                if transaction[:payer] == payer[:payer]
                    payer[:points] -= transaction[:points] 
                    print "transaction_total #{transaction_total}\n"
                    print "answer #{payer[:points]} \n payer #{payer[:payer]} transaction #{transaction[:payer]} \n\n"
                end
            elsif transaction[:payer] == payer[:payer] && user[:points] < transaction_total
                final_amount = transaction_total - (transaction_total - user[:points])
                print "final_amount #{final_amount}\n transaction_total #{transaction_total}\n"
                payer[:points] = (payer[:points] - transaction[:points])
                print "else answer #{payer[:points]} \n payer #{payer[:payer]} transaction #{transaction[:payer]} \n\n"
            end
        end

        render :json => Payer.all
    end
end
