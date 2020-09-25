require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'itemの保存' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
      it 'priceが抜けていても保存できること' do
        @item.price = nil
        expect(@item).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it '品名が空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('品名を入力してください')
      end
      it 'カテゴリーが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('区分を入力してください')
      end
      it '在庫数が空だと保存できない' do
        @item.stock = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('在庫数は0〜100の間で入力してください')
      end
      it '在庫数がマイナスだと保存できない' do
        @item.stock = -1
        @item.valid?
        expect(@item.errors.full_messages).to include('在庫数は0〜100の間で入力してください')
      end
      it '在庫数が101以上だと保存できない' do
        @item.stock = 101
        @item.valid?
        expect(@item.errors.full_messages).to include('在庫数は0〜100の間で入力してください')
      end
      it '価格がマイナスだと保存できない' do
        @item.price = -1
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力する場合は0〜1000,000の間で入力してください')
      end
      it '在庫数が100,001以上だと保存できない' do
        @item.price = 100001
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力する場合は0〜1000,000の間で入力してください')
      end
    end
  end
end
