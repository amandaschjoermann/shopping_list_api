class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list

  validates :name, presence: true, uniqueness: { scope: :shopping_list_id }

  def done?
    self.done
  end
end
