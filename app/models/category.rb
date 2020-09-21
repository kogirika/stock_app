class Category < ActiveHash::Base
  self.data =[
    { id:0, name: "未選択" },
    { id:1, name: "日用品" },
    { id:2, name: "食品" },
    { id:3, name: "趣味" }
  ]
end