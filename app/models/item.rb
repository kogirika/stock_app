class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :stock
  end

  belongs_to :user

  #一覧表示をcurrent_userのものだけにする
  def self.display(user_id)
    Item.where(user_id: user_id)
  end


end
