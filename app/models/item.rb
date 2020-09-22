class Item < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # アソシエーション
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :name, :stock, :category_id
    validates :stock, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0,
                                      message: "はマイナスにできません" }
  end


  #一覧表示をcurrent_userのものだけにする
  def self.display(user_id)
    Item.where(user_id: user_id)
  end


end
