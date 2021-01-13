require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user1 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,user_id: @user1.id)
    @user2 = FactoryBot.create(:user)
    @order = FactoryBot.build(:user_order,user_id: @user2.id, item_id: @item.id)
    sleep(1)
  end

  describe '購入情報入力' do
    context '購入ができる時' do

      it "全て入力し登録できること" do
        expect(@order).to be_valid
      end
    end

    context '購入ができない時' do

      it "tokenが空では購入できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
  
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeの(-)が未入力だと購入できない' do
        @order.postal_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
  
      it 'prefecture_idが未選択だと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it 'prefecture_idが空だと購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it 'addressが空だと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end

      it 'cityの内容に全角半角英語があると購入できない' do
        @order.city = "ｙｏｋｏｈａｍａsi"
        @order.valid?
        expect(@order.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end

      it 'phone_numberが空だと購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'pgone_numberに(-)があると購入できない' do
        @order.phone_number = "090-1111-1111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'pgone_numberが９桁以下だと購入できない' do
        @order.phone_number = "090-111-111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'pgone_numberが11桁以上だと購入できない' do
        @order.phone_number = "090-1111-11111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
