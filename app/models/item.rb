class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :stock
  end

  belongs_to :user
end
