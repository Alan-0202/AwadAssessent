# class PurchasesController < InheritedResources::Base
#
#   private
#
#     def purchase_params
#       params.require(:purchase).permit(:user_id, :info, :pay)
#     end
#
#
#
#   def show
#     not_found
#   end
# end
#
class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
    not_found
  end
end
