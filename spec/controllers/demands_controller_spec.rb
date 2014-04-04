# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe DemandsController, '申し込み' do
  fixtures :all

  context 'にログイン無しでアクセスする場合' do
    describe '申し込む' do
      it "申し込み画面が表示される" do
        get 'new'
        response.should be_success
      end
    end

    describe '申し込みを送信する' do
      context 'CI 環境レンタルを申し込む' do
        it "CI 環境レンタルが申し込まれる" do
          post 'create', :demand => {
            "service_type"=>"ci",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"2012/07/01",
            "end_date"=>"2012/12/31",
            "ip"=>"172.16.1.1/24",
            "project_name"=>"テストプロジェクト",
            "purpose"=>"テスト",
            "message"=>"テストです"
          }, :vms => {
            "vm_type_1st"=>"選択してください",
            "size_of_vm_1st"=>"選択してください",
            "number_of_vm_1st"=>"選択 してください",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"",
            "user0_name"=>"",
            "user0_pass"=>"",
            "added_users"=>""
          }, :books => {
            "title"=>"",
            "contact_at_stock"=>"",
            "date_should_contact"=>""
          }, :enquiries => {
            "title"=>"",
            "detail"=>""
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "ci"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "2012/07/01"
          subject.instance_variable_get(:@demand)['start_date'].should == expect
          expect = "2012/12/31"
          subject.instance_variable_get(:@demand)['end_date'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'
        end
      end

      context 'クロスブラウザ環境レンタルを申し込む' do
        it "クロスブラウザ環境レンタルが申し込まれる" do
          post 'create', :demand => {
            "service_type"=>"crossbrowser",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"2012/07/01",
            "end_date"=>"2012/12/31",
            "ip"=>"172.16.1.1/24",
            "project_name"=>"テストプロジェクト",
            "purpose"=>"テスト",
            "message"=>"テストです"
          }, :vms => {
            "vm_type_1st"=>"選択してください",
            "size_of_vm_1st"=>"選択してください",
            "number_of_vm_1st"=>"選択 してください",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"",
            "user0_name"=>"",
            "user0_pass"=>"",
            "added_users"=>""
          }, :books => {
            "title"=>"",
            "contact_at_stock"=>"",
            "date_should_contact"=>""
          }, :enquiries => {
            "title"=>"",
            "detail"=>""
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "crossbrowser"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "2012/07/01"
          subject.instance_variable_get(:@demand)['start_date'].should == expect
          expect = "2012/12/31"
          subject.instance_variable_get(:@demand)['end_date'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'
        end
      end

      context '仮想サーバーレンタルを申し込む' do
        it "仮想サーバーレンタルが申し込まれる" do
          post 'create', :demand => {
            "service_type"=>"vm",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"2012/07/01",
            "end_date"=>"2012/12/31",
            "ip"=>"172.16.1.1/24",
            "project_name"=>"テストプロジェクト",
            "purpose"=>"テスト",
            "message"=>"テストです"
          }, :vms => {
            "vm_type_1st"=>"CentOS 6.0 64bit",
            "size_of_vm_1st"=>"S",
            "number_of_vm_1st"=>"1",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"",
            "user0_name"=>"",
            "user0_pass"=>"",
            "added_users"=>""
          }, :books => {
            "title"=>"",
            "contact_at_stock"=>"",
            "date_should_contact"=>""
          }, :enquiries => {
            "title"=>"",
            "detail"=>""
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "vm"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "2012/07/01"
          subject.instance_variable_get(:@demand)['start_date'].should == expect
          expect = "2012/12/31"
          subject.instance_variable_get(:@demand)['end_date'].should == expect
          expect = "CentOS 6.0 64bit"
          subject.instance_variable_get(:@vm)['vm_type_1st'].should == expect
          expect = "S"
          subject.instance_variable_get(:@vm)['size_of_vm_1st'].should == expect
          expect = "1"
          subject.instance_variable_get(:@vm)['number_of_vm_1st'].should == expect
          expect = "選択してください"
          subject.instance_variable_get(:@vm)['number_of_vm_2nd'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'

        end
      end

      context 'SVN ホスティングを申し込む' do
        it "SVN ホスティングが申し込まれる" do
          post 'create', :demand => {
            "service_type"=>"svn",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"2012/07/01",
            "end_date"=>"2012/12/31",
            "ip"=>"172.16.1.1/24",
            "project_name"=>"テストプロジェクト",
            "purpose"=>"テスト",
            "message"=>"テストです"
          }, :vms => {
            "vm_type_1st"=>"選択してください",
            "size_of_vm_1st"=>"選択してください",
            "number_of_vm_1st"=>"選択 してください",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"test_repo",
            "user0_name"=>"test_user",
            "user0_pass"=>"test_pass",
            "added_users"=>"hoge, fuga"
          }, :books => {
            "title"=>"",
            "contact_at_stock"=>"",
            "date_should_contact"=>""
          }, :enquiries => {
            "title"=>"",
            "detail"=>""
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "svn"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "2012/07/01"
          subject.instance_variable_get(:@demand)['start_date'].should == expect
          expect = "2012/12/31"
          subject.instance_variable_get(:@demand)['end_date'].should == expect
          expect = "test_repo"
          subject.instance_variable_get(:@svn)['repo_name'].should == expect
          expect = "test_user"
          subject.instance_variable_get(:@svn)['user0_name'].should == expect
          expect = "test_pass"
          subject.instance_variable_get(:@svn)['user0_pass'].should == expect
          expect = "hoge, fuga"
          subject.instance_variable_get(:@svn)['added_users'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'
        end
      end

      context '書籍を借りる' do
        it "書籍貸出が申し込まれる" do
          post 'create', :demand => {
            "service_type"=>"book",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"",
            "end_date"=>"",
            "ip"=>"",
            "project_name"=>"",
            "purpose"=>"",
            "message"=>""
          }, :vms => {
            "vm_type_1st"=>"選択してください",
            "size_of_vm_1st"=>"選択してください",
            "number_of_vm_1st"=>"選択 してください",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"",
            "user0_name"=>"",
            "user0_pass"=>"",
            "added_users"=>""
          }, :books => {
            "title"=>"Ruby レシピブック",
            "contact_at_stock"=>"03-1111-2222",
            "date_should_contact"=>"2012/06/30"
          }, :enquiries => {
            "title"=>"",
            "detail"=>""
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "book"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "Ruby レシピブック"
          subject.instance_variable_get(:@book)['title'].should == expect
          expect = "03-1111-2222"
          subject.instance_variable_get(:@book)['contact_at_stock'].should == expect
          expect = "2012/06/30"
          subject.instance_variable_get(:@book)['date_should_contact'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'
        end
      end

      context '技術 SE 部に問い合わせをする' do
        it "お問い合わせが送信される" do
          post 'create', :demand => {
            "service_type"=>"enquiry",
            "badge"=>"031698",
            "email"=>"ya-nakayama@dts.co.jp",
            "name"=>"中山 康弘",
            "contacts"=>"03-3437-7532",
            "badge_b"=>"",
            "email_b"=>"",
            "name_b"=>"",
            "start_date"=>"2012/07/01",
            "end_date"=>"2012/12/31",
            "ip"=>"172.16.1.1/24",
            "project_name"=>"テストプロジェクト",
            "purpose"=>"テスト",
            "message"=>"テストです"
          }, :vms => {
            "vm_type_1st"=>"選択してください",
            "size_of_vm_1st"=>"選択してください",
            "number_of_vm_1st"=>"選択 してください",
            "vm_type_2nd"=>"選択してください",
            "size_of_vm_2nd"=>"選択してください",
            "number_of_vm_2nd"=>"選択してください",
            "vm_type_3rd"=>"選択してください",
            "size_of_vm_3rd"=>"選択してください",
            "number_of_vm_3rd"=>"選択してください"
          }, :svns => {
            "repo_name"=>"",
            "user0_name"=>"",
            "user0_pass"=>"",
            "added_users"=>""
          }, :books => {
            "title"=>"",
            "contact_at_stock"=>"",
            "date_should_contact"=>""
          }, :enquiries => {
            "title"=>"テスト",
            "detail"=>"ほげほげ"
          }

          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          expect = "enquiry"
          subject.instance_variable_get(:@demand)['service_type'].should == expect
          expect = "031698"
          subject.instance_variable_get(:@demand)['badge'].should == expect
          expect = "ya-nakayama@dts.co.jp"
          subject.instance_variable_get(:@demand)['email'].should == expect
          expect = "中山 康弘"
          subject.instance_variable_get(:@demand)['name'].should == expect
          expect = "テスト"
          subject.instance_variable_get(:@enquiry)['title'].should == expect
          expect = "ほげほげ"
          subject.instance_variable_get(:@enquiry)['detail'].should == expect
          flash[:notice].should_not be_nil
          flash[:notice].should == 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします'
        end
      end

    end
  end
end
