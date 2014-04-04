# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe AnswersController, 'アンケート回答' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe '一覧表示' do
      it "サインアップ画面にリダイレクトされる" do
        get 'new'
        response.should be_success
      end
    end

    describe 'アンケート回答' do
      it "新しい回答が作成される" do
        post 'create' , :answer => {
          "badge"=>"031698",
          "email"=>"ya-nakayama@dts.co.jp",
          "name"=>"中山 康弘",
          "contacts"=>"03-3437-7532",
          "question_id"=>1,
          "answer_1"=>"ほげ",
          "answer_2"=>"ふが",
          "answer_3"=>"ぴよ",
          "answer_4"=>"",
          "answer_5"=>"",
          "answer_6"=>"",
          "answer_7"=>"",
          "answer_8"=>"",
          "answer_9"=>"",
          "answer_10"=>"",
        }

        answer = Answer.find(2)

        response.should be_redirect
        response.redirect_url.should == 'http://test.host/'
        response.header.should have_at_least(1).items
        response.body.should have_at_least(1).items
        expect = "031698"
        subject.instance_variable_get(:@answer)['badge'].should == expect
        answer.badge.should == expect
        expect = "ほげ"
        subject.instance_variable_get(:@answer)['answer_1'].should == expect
        answer.answer_1.should == expect
        expect = "ふが"
        subject.instance_variable_get(:@answer)['answer_2'].should == expect
        answer.answer_2.should == expect
        expect = "ぴよ"
        subject.instance_variable_get(:@answer)['answer_3'].should == expect
        answer.answer_3.should == expect
        flash[:notice].should_not be_nil
        flash[:notice].should == 'アンケートへのご協力ありがとうございました！'
      end
    end
  end

  context 'に管理者ログインしてアクセスする場合' do
    login_admin

    describe '一覧表示' do
      it "一覧表示画面が表示される" do
        get 'new'
        response.should be_success
      end
    end

    describe 'アンケート回答' do
      it "新しい回答が作成される" do
        post 'create' , :answer => {
          "badge"=>"031698",
          "email"=>"ya-nakayama@dts.co.jp",
          "name"=>"中山 康弘",
          "contacts"=>"03-3437-7532",
          "question_id"=>1,
          "answer_1"=>"ほげ",
          "answer_2"=>"ふが",
          "answer_3"=>"ぴよ",
          "answer_4"=>"",
          "answer_5"=>"",
          "answer_6"=>"",
          "answer_7"=>"",
          "answer_8"=>"",
          "answer_9"=>"",
          "answer_10"=>"",
        }

        answer = Answer.find(2)

        response.should be_redirect
        response.redirect_url.should == 'http://test.host/'
        response.header.should have_at_least(1).items
        response.body.should have_at_least(1).items
        expect = "031698"
        subject.instance_variable_get(:@answer)['badge'].should == expect
        answer.badge.should == expect
        expect = "ほげ"
        subject.instance_variable_get(:@answer)['answer_1'].should == expect
        answer.answer_1.should == expect
        expect = "ふが"
        subject.instance_variable_get(:@answer)['answer_2'].should == expect
        answer.answer_2.should == expect
        expect = "ぴよ"
        subject.instance_variable_get(:@answer)['answer_3'].should == expect
        answer.answer_3.should == expect
        flash[:notice].should_not be_nil
        flash[:notice].should == 'アンケートへのご協力ありがとうございました！'
      end
    end
  end
end
