# frozen_string_literal: true

require 'rails_helper'

describe 'userのテスト' do
  describe '新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、フォローしたユーザーの投稿一覧画面になっている' do
        click_button 'Sign up'
        expect(current_path).to eq '/posts/following_posts'
      end
    end
  end

  describe 'ログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、フォローしたユーザーの投稿一覧画面になっている' do
        expect(current_path).to eq '/posts/following_posts'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

end