module Api
  module V1
    class ShoppingListItemsIndexAction

      def initialize
        @shopping_list = ShoppingList.includes(:shopping_list_items).first
      end

      def self.call
        new.to_hash
      end

      def to_hash
        {
          id: shopping_list.id,
          list_name: shopping_list.name,
          items: shopping_list_items
        }
      end

      private

      attr_reader :shopping_list

      def shopping_list_items
        shopping_list.shopping_list_items.map do |list_item|
          ::ShoppingListItemPresenter.new(list_item).to_hash
        end
      end
    end
  end
end
