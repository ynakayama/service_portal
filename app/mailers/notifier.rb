# -*- encoding: utf-8 -*-

require 'socket'

class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost"
  if Socket.gethostname == 'library.virtualization.dts.co.jp'
    default :sender => "tech-sp@dts.co.jp"
    default :to => "tech-sp@dts.co.jp"
  else
    default :sender => "ya-nakayama@dts.co.jp"
    default :to => "ya-nakayama@dts.co.jp"
  end

  def accept_demands(demand)
    mail(:subject => "【イノベーション推進部サービスポータル】新しい申し込みがありました！ ID:" + demand.id.to_s,
         :body => "以下の内容で送信を受け付けました。\n\n" +
                  "申し込み番号: " + demand.id.to_s + "\n" +
                  "サービスの種類: " + demand.service_type + "\n" +
                  "社員番号: " + demand.badge + "\n" +
                  "メールアドレス: " + demand.email + "\n" +
                  "名前: " + demand.name + "\n\n" +
                  "ポータルサイトの管理画面から内容を確認してください。\n" +
                  "ホスト: http://" + Socket.gethostname
        )
  end

  def notify_user(demand)
    mail(:subject => "【イノベーション推進部サービスポータル】送信を受け付けました！",
         :body => "ご利用ありがとうございます！\n" +
                  "以下の内容で送信を受け付けました。\n\n" +
                  "お申し込み番号: " + demand.id.to_s + "\n" +
                  "サービスの種類: " + demand.service_type + "\n" +
                  "社員番号: " + demand.badge + "\n" +
                  "メールアドレス: " + demand.email + "\n" +
                  "お名前: " + demand.name + "\n\n" +
                  "後ほどイノベーション推進部より連絡を差し上げますのでお待ち下さい。\n\n" +
                  "イノベーション推進部サービスポータル http://library.virtualization.dts.co.jp",
         :to => demand.email
        )
  end

  def processed_demands(demand,user)
    mail(:subject => "【イノベーション推進部サービスポータル】申し込みが処理されました ID:" + demand.id.to_s,
         :body => "以下の内容で受付が処理されました。\n\n" +
                  "申し込み番号: " + demand.id.to_s + "\n" +
                  "サービスの種類: " + demand.service_type + "\n\n" +
                  "ホスト: http://" + Socket.gethostname + "\n" +
                  "処理担当者: " + user.username
        )
  end
end
