# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe QuestionsController, 'アンケート管理' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe '一覧表示' do
      it "サインイン画面にリダイレクトされる" do
        get 'index'
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe 'アンケート詳細' do
      it "サインイン画面にリダイレクトされる" do
        get 'show', :id => 1
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe '回答一覧' do
      it "サインイン画面にリダイレクトされる" do
        get 'answers', :id => 1
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe 'アンケート新規作成' do
      it "サインイン画面にリダイレクトされる" do
        get 'new'
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe 'アンケート編集' do
      it "サインイン画面にリダイレクトされる" do
        get 'edit', :id => 1
        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe 'アンケート作成処理' do
      it "サインイン画面にリダイレクトされる" do
        post 'create' , :question => {
          "finish"=>0,
          "title"=>"テスト",
          "question_1"=>"ほげ",
          "question_2"=>"ふが",
          "question_3"=>"ぴよ",
          "question_4"=>"",
          "question_5"=>"",
          "question_6"=>"",
          "question_7"=>"",
          "question_8"=>"",
          "question_9"=>"",
          "question_10"=>"",
        }

        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end
    describe 'アンケート編集処理' do
      it "アンケートが更新される" do
        post 'update' , :question => {
          "finish"=>1,
          "title"=>"新タイトル",
          "question_1"=>"テスト",
          "question_2"=>"あああ",
          "question_3"=>"いいい",
          "question_4"=>"ううう",
          "question_5"=>"",
          "question_6"=>"",
          "question_7"=>"",
          "question_8"=>"",
          "question_9"=>"",
          "question_10"=>"",
        }, :id => 1

        response.should be_redirect
        response.redirect_url.should == 'http://test.host/users/sign_in'
      end
    end

    describe 'アンケート削除処理' do
      context 'アンケートを削除すると' do
        it "アンケートが消去される" do
          post 'destroy', :id => 1

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/users/sign_in'
        end
      end
    end
  end

  context 'に管理者ログインしてアクセスする場合' do
    login_admin

    describe '一覧表示' do
      it "一覧画面が表示される" do
        get 'index'
        response.should be_success
      end
    end

    describe 'アンケート詳細' do
      it "詳細画面が表示される" do
        get 'show', :id => 1
        response.should be_success
      end
    end

    describe '回答一覧' do
      it "回答の一覧が表示される" do
        get 'answers', :id => 1
        response.should be_success
      end
    end

    describe 'アンケート新規作成' do
      it "新規作成画面が表示される" do
        get 'new'
        response.should be_success
      end
    end

    describe 'アンケート編集' do
      it "編集画面が表示される" do
        get 'edit', :id => 1
        response.should be_success
      end
    end

    describe 'アンケート作成処理' do
      it "アンケートが作成される" do
        post 'create' , :question => {
          "finish"=>0,
          "title"=>"テスト",
          "question_1"=>"ほげ",
          "question_2"=>"ふが",
          "question_3"=>"ぴよ",
          "question_4"=>"",
          "question_5"=>"",
          "question_6"=>"",
          "question_7"=>"",
          "question_8"=>"",
          "question_9"=>"",
          "question_10"=>"",
        }

        q = Question.find(2)

        response.redirect_url.should == 'http://test.host/questions'
        response.header.should have_at_least(1).items
        response.body.should have_at_least(1).items
        expect = "テスト"
        subject.instance_variable_get(:@question)['title'].should == expect
        q.title.should == expect
        expect = "ほげ"
        subject.instance_variable_get(:@question)['question_1'].should == expect
        q.question_1.should == expect
        expect = "ふが"
        subject.instance_variable_get(:@question)['question_2'].should == expect
        q.question_2.should == expect
        expect = "ぴよ"
        subject.instance_variable_get(:@question)['question_3'].should == expect
        q.question_3.should == expect
        expect = false
        subject.instance_variable_get(:@question)['finish'].should == expect
        q.finish.should == expect
        flash[:notice].should_not be_nil
        flash[:notice].should == 'アンケートは正常に作成されました'
      end
    end

    describe 'アンケート編集処理' do
      it "アンケートが更新される" do
        post 'update' , :question => {
          "finish"=>1,
          "title"=>"新タイトル",
          "question_1"=>"テスト",
          "question_2"=>"あああ",
          "question_3"=>"いいい",
          "question_4"=>"ううう",
          "question_5"=>"",
          "question_6"=>"",
          "question_7"=>"",
          "question_8"=>"",
          "question_9"=>"",
          "question_10"=>"",
        }, :id => 1

        q = Question.find(1)

        response.redirect_url.should == 'http://test.host/questions'
        response.header.should have_at_least(1).items
        response.body.should have_at_least(1).items
        expect = "新タイトル"
        subject.instance_variable_get(:@question)['title'].should == expect
        expect = "テスト"
        subject.instance_variable_get(:@question)['question_1'].should == expect
        q.question_1.should == expect
        expect = "あああ"
        subject.instance_variable_get(:@question)['question_2'].should == expect
        q.question_2.should == expect
        expect = "いいい"
        subject.instance_variable_get(:@question)['question_3'].should == expect
        q.question_3.should == expect
        expect = "ううう"
        subject.instance_variable_get(:@question)['question_4'].should == expect
        q.question_4.should == expect
        expect = true
        subject.instance_variable_get(:@question)['finish'].should == expect
        q.finish.should == expect
        flash[:notice].should_not be_nil
        flash[:notice].should == 'アンケートは正常に変更されました'
      end
    end

    describe 'アンケート削除処理' do
      context 'アンケートを削除すると' do
        it "アンケートが消去される" do
          post 'destroy', :id => 1

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/questions'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          lambda {
            Question.find(1)
          }.should raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

end
