# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe ServicesController, 'サービス管理' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe '一覧表示' do
      it "サインイン画面にリダイレクトされる" do
        get 'index'
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe '編集' do
      it "サインイン画面にリダイレクトされる" do
        get 'edit', :id => 1
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe '更新' do
      context '申し込みを処理する' do
        it "サインイン画面にリダイレクトされる" do
          post 'update', :demand => {
            "processed" => true,
          }, :id => 1
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/users/sign_in'
        end
      end

      context '申し込みを処理済みにするのをやめる' do
        it "サインイン画面にリダイレクトされる" do
          post 'update', :demand => {
            "processed" => false,
          }, :id => 2
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/users/sign_in'
        end
      end
    end
  end

  context 'に管理者ログインしてアクセスする場合' do
    login_admin

    describe '一覧表示' do
      it "サービス管理画面が表示される" do
        get 'index'
        response.should be_success
      end
    end

    describe '編集' do
      it "申し込み画面が表示される" do
        get 'edit', :id => 1
        response.should be_success
      end
    end

    describe '更新' do
      context '申し込みを処理する' do
        it "申し込みが処理済みになる" do
          post 'update', :demand => {
            "processed" => true,
          }, :id => 1

          demand = Demand.find(1)

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/services'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = true
          subject.instance_variable_get(:@demand)['processed'].should == expect
          demand.processed == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == '申し込みは正常に処理されました'
        end
      end

      context '申し込みを処理済みにするのをやめる' do
        it "申し込みが未処理になる" do
          post 'update', :demand => {
            "processed" => false,
          }, :id => 2

          demand = Demand.find(2)

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/services'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = false
          subject.instance_variable_get(:@demand)['processed'].should == expect
          demand.processed == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == '申し込みは正常に処理されました'
        end
      end
    end

  end
end
