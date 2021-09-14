require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプ新規登録' do
    context '新規登録できる場合' do
      it "titleとconcept、catchcopy、imageが存在すれば登録できる" do
        expect(@prototype).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "titleが空では登録できない" do
        @prototype.title= ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it "conceptが空では登録できない" do
        @prototype.concept= ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it "catchcopyが空では登録できない" do
        @prototype.catchcopy= ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catchcopy can't be blank")
      end
      it "imageが空では登録できない" do
        @prototype.image= nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include('User must exist')
      end
    end
  end
end

