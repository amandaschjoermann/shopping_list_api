module Api
  module V1
    class ShoppingListItemsCreateAction
      def initialize(attributes)
        @shopping_list = ShoppingList.includes(:shopping_list_items).first
        @shopping_list_item = ShoppingListItem.new(attributes)
        set_shopping_list
      end

      def self.call(attributes)
        new(attributes).save_shopping_list_item
      end

      def save_shopping_list_item
        shopping_list_item.save ? success_response : error_response
      end

      private

      attr_reader :shopping_list, :shopping_list_item


      def success_response
        { success: true, newItemName: shopping_list_item.name }
      end

      def error_response
        { success: false, status: :unprocessable_entity, errors: shopping_list_item.errors.messages }
      end

      def set_shopping_list
        shopping_list_item.shopping_list = shopping_list
      end
    end
  end
end
