# frozen_string_literal: true

require 'rails_helper'

describe 'userモデルのテスト' do
  it "内容が問題ない場合保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end