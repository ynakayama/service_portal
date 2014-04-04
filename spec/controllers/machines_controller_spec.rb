# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe MachinesController, '仮想サーバー管理' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe '一覧表示' do
      it "サインイン画面にリダイレクトされる" do
        get 'index'
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe '詳細' do
      it "サインイン画面にリダイレクトされる" do
        get 'show', :id => 1
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe '新規' do
      it "サインイン画面にリダイレクトされる" do
        get 'new'
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

    describe '作成' do
      context '仮想サーバーの情報を追加すると' do
        it "サインイン画面にリダイレクトされる" do
          post 'create', :machine => {
            "vm_type" => "CentOS 5.8 64bit + Subversion",
          }, :id => 5
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/users/sign_in'
        end
      end
    end

    describe '更新' do
      context '仮想サーバーの情報を書き換えると' do
        it "サインイン画面にリダイレクトされる" do
          post 'update', :machine => {
            "vm_type" => "CentOS 6.2 64bit + Subversion",
          }, :id => 1
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/users/sign_in'
        end
      end
    end

    describe '削除' do
      context '仮想サーバーの情報を削除すると' do
        it "サインイン画面にリダイレクトされる" do
          post 'destroy', :id => 2
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

    describe '詳細' do
      it "詳細画面が表示される" do
        get 'show', :id => 1
        response.should be_success
      end
    end

    describe '新規' do
      it "新規作成画面が表示される" do
        get 'new'
        response.should be_success
      end
    end

    describe '編集' do
      it "編集画面が表示される" do
        get 'edit', :id => 1
        response.should be_success
      end
    end

    describe '作成' do
      context '仮想サーバーの情報を追加すると' do
        it "仮想サーバーの情報が追加される" do
          post 'create', :machine => {
            "vm_type" => "CentOS 5.8 64bit + Subversion",
          }, :id => 5

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/machines'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "CentOS 5.8 64bit + Subversion"
          subject.instance_variable_get(:@machine)['vm_type'].should == expect
          Machine.find(5).vm_type.should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == '仮想サーバーは正常に追加されました'
        end
      end
    end

    describe '更新' do
      context '仮想サーバーの情報を書き換えると' do
        it "仮想サーバーの情報が更新される" do
          post 'update', :machine => {
            "vm_type" => "CentOS 6.2 64bit + Subversion",
          }, :id => 1

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/machines'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "CentOS 6.2 64bit + Subversion"
          subject.instance_variable_get(:@machine)['vm_type'].should == expect
          Machine.find(1).vm_type.should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == '仮想サーバーは正常に変更されました'
        end
      end
    end

    describe '削除' do
      context '仮想サーバーの情報を削除すると' do
        it "仮想サーバーの情報が消去される" do
          post 'destroy', :id => 2

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/machines'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          lambda{ Machine.find(2) }.should raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
