class Item < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # アソシエーション
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :name, :category_id
  end
  validates :stock, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 100,
                                    message: "は0〜100の間で入力してください" }
  validates :price, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 100_000,
                                    message: "を入力する場合は0〜1000,000の間で入力してください" }, allow_nil: true

  # 一覧表示をcurrent_userのものだけにする
  def self.display(user_id)
    Item.where(user_id: user_id)
  end
end
