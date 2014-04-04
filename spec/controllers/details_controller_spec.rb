# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe DetailsController, 'サービスの説明' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe 'サービス詳細画面' do
      it "サービスの説明が表示される" do
        get 'services'
        response.should be_success
      end
    end
  end

  context 'に管理者ログインしてアクセスする場合' do
    login_admin

    describe 'サービス詳細画面' do
      it "サービスの説明が表示される" do
        get 'services'
        response.should be_success
      end
    end
  end
end
