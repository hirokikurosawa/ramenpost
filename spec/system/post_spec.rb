# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe ' 新規投稿' do
    context '表示の確認' do
      before do
      visit new_post_path
      end
      it '新規投稿画面が表示される' do
        expect(page).to have_content '投稿を作成'
      end
      it '画像フォームが表示される' do
        expect(page).to have_field 'post[post_image]'
      end
      it 'コメントフォームが表示される' do
        expect(page).to have_field 'post[introduction]'
      end
      it '新規投稿ボタンが表示される' do
        expect(page).to have_button '投稿'
      end
      it '投稿に成功する' do
        attach_file 'post[post_image]', Rails.root.join('app/assets/images/default.png')
        fill_in 'post[introduction]', with: Faker::Lorem.characters(number:50)
        click_button '投稿'
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it '投稿に失敗する' do
        click_button '投稿'
        expect(page).to have_content '画像を選択してください'
        expect(current_path).to eq('/posts')
      end
    end
  end

  describe '詳細画面' do
    context '投稿詳細画面の表示を確認' do
      it 'ユーザーネームのリンク先が正しい' do
        visit post_path(post)
        expect(page).to have_link post.user.nickname, href: user_path(post.user)
      end
      it '投稿の説明文が表示される' do
        visit post_path(post)
        expect(page).to have_content post.introduction
      end
      it '投稿のいいね数が表示される' do
        visit post_path(post)
        expect(page).to have_content post.likes.count
      end
      it '投稿日時が表示される' do
        visit post_path(post)
        expect(page).to have_content post.created_at.strftime("%Y/%m/%d %H:%M:%S")
      end
    end
  end

end