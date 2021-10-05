class ShoppingListItemPresenter

  def initialize(shopping_list_item)
    @shopping_list_item = shopping_list_item
  end

  def self.call_with(shopping_list_item)
    new(shopping_list_item).to_hash
  end

  def to_hash
    {
      id: shopping_list_item.id,
      name: shopping_list_item.name,
      done: shopping_list_item.done?
    }
  end

  private

  attr_reader :shopping_list_item
end
