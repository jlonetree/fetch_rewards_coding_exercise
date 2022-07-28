$payers = Payer.all
class UserController < ApplicationController

    def spend
        user = User.find_by(params[:id])
        transactions = Transaction.all.sort_by{ | transaction | transaction[:timestamp] }
        spend_total = dannon_points = miller_coors_points = unilever_points = 0
        
        transactions.each do | transaction |
            payer = Payer.find_by(payer: transaction[:payer])
            payer_total = payer[:points]

            if user[:points] >= spend_total
                spend_total += transaction[:points]
                user[:points] < spend_total ? excess_points = spend_total - user[:points] : excess_points = 0

                if payer[:payer] == "DANNON"
                    dannon_points = dannon_points - (transaction[:points] - excess_points)
                elsif payer[:payer] == "MILLER COORS"
                    miller_coors_points = miller_coors_points - (transaction[:points] - excess_points)
                else
                    unilever_points = unilever_points - (transaction[:points] - excess_points)
                end
            end
        end

        payers = $payers.each{ | payer | 
            if payer[:payer] == "DANNON"
                payer[:points] = dannon_points
            elsif payer[:payer] == "MILLER COORS"
                payer[:points] = miller_coors_points
            else
                payer[:points] = unilever_points
            end
        }

        render :json => $payers, :except => [:id, :created_at, :updated_at]
        return $payers
    end

    def points_balance
        transactions = Transaction.all
        payer_balances = {}
        dannon_points = miller_coors_points = unilever_points = 0

        transactions.each do | transaction |
            payer = Payer.find_by(payer: transaction[:payer])
            if payer[:payer] == "DANNON"
                dannon_points = dannon_points - transaction[:points]
            elsif payer[:payer] == "MILLER COORS"
                miller_coors_points = miller_coors_points - transaction[:points]
            else
                unilever_points = unilever_points - transaction[:points]
            end 
        end

        $payers.each { | payer | 
            if payer[:payer] == "DANNON"
                payer[:points] -= dannon_points
                payer_balances.store(payer[:payer], payer[:points]) 
            elsif payer[:payer] == "MILLER COORS"
                payer[:points] -= miller_coors_points
                payer_balances.store(payer[:payer], payer[:points]) 
            else
                payer[:points] -= unilever_points
                payer_balances.store(payer[:payer], payer[:points])
            end
        }

        render :json => payer_balances
    end

end
