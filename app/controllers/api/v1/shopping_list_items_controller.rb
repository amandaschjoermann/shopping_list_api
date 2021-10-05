module Api
  module V1
    class ShoppingListItemsController < ApplicationController
      def create
        action = ShoppingListItemsCreateAction
        render json: action.call(shopping_list_item_params)
      end

      def index
        action = ShoppingListItemsIndexAction
        render json: action.call
      end

      private

      def shopping_list_item_params
        params.require(:shopping_list_item).permit(:name)
      end
    end
  end
end
