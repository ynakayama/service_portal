# -*- encoding: utf-8 -*-

class SampleData < ActiveRecord::Migration
  def change
    # システム
    u = User.new(
                 :username => 'system',
                 :email => 'xxxxxx@dts.co.jp',
                 :password => 'xxxxxx',
                 :password_confirmation=> 'xxxxxx'
    )
    u.save!

    # 仮想サーバーのモデル
    m = Machine.new(:vm_type => 'CentOS 6.0 64bit')
    m.save!
    m = Machine.new(:vm_type => 'Windows Server 2008 R2 Standard Edition')
    m.save
    m = Machine.new(:vm_type => 'Red Hat Enterprise Linux 5.5 64bit')
    m.save!
    m = Machine.new(:vm_type => 'CentOS 5.x 64bit + Subversion')
    m.save!

    # サポートメニュー
    s = Support.new(
                 :course => 'インポート',
                 :text => '仮想サーバーをインポートします',
                 :service_type => 'support_vm'
    )
    s.save!
    s = Support.new(
                 :course => 'エクスポート',
                 :text => '仮想サーバーをエクスポートします',
                 :service_type => 'support_vm'
    )
    s.save!
    s = Support.new(
                 :course => '起動',
                 :text => '停止中の仮想サーバーを起動します',
                 :service_type => 'support_vm'
    )
    s.save!

    # 管理者
    u = User.new(
                 :username => 'XXX',
                 :email => 'xxx@dts.co.jp',
                 :password => 'xxxxxxxx',
                 :password_confirmation=> 'xxxxxxxx'
    )
    u.save!

    # サンプル/テストデータ
    unless Rails.env.production?
      100.times do
        d = Demand.new(
                     :user_id => 1,
                     :badge => '111111',
                     :email => 'xxxxxx@dts.co.jp',
                     :name => 'サンプル太郎',
                     :contacts => '03-1111-2222',
                     :project_name => 'テスト',
                     :badge_b => '222222',
                     :email_b => 'xxxxxx@dts.co.jp',
                     :name_b => 'テスト次郎',
                     :start_date => '2012/01/01',
                     :end_date => '2012/12/31',
                     :ip => '172.16.0.1/16',
                     :purpose => 'ふが',
                     :message => 'ほげ',
                     :service_type => 'svn',
                     :processed => true
        )
        d.save!
        v = Vm.new(
                     :demand_id => d.id,
                     :vm_type_1st => "CentOS 6",
                     :size_of_vm_1st => "S",
                     :number_of_vm_1st => "2",
                     :vm_type_2nd => "RHEL 6",
                     :size_of_vm_2nd => "M",
                     :number_of_vm_2nd => "2",
                     :vm_type_3rd => "CentOS 5",
                     :size_of_vm_3rd => "M",
                     :number_of_vm_3rd => "8"
        )
        v.save!
        s = Svn.new(
                     :demand_id => d.id,
                     :repo_name => 'sample',
                     :user0_name => 'sample_user',
                     :user0_pass => 'sample_pass',
                     :added_users => ''
        )
        s.save!
        b = Book.new(
                     :demand_id => d.id,
                     :title => "書籍タイトル",
                     :contact_at_stock => "ふがふが",
                     :date_should_contact => "2012/03/01"
        )
        b.save!
        e = Enquiry.new(
                     :demand_id => d.id,
                     :title => "お問い合わせ",
                     :detail => "ほげほげ"
        )
        e.save!
        d = Demand.new(
                     :badge => '444444',
                     :email => 'xxxxxx@dts.co.jp',
                     :name => 'サンプル次郎',
                     :contacts => '03-3333-4444',
                     :project_name => 'テスト',
                     :badge_b => '666666',
                     :email_b => 'xxxxxx@dts.co.jp',
                     :name_b => 'テスト五郎',
                     :start_date => '2012/01/01',
                     :end_date => '2012/12/31',
                     :ip => '172.16.0.1/16',
                     :purpose => 'ふが',
                     :message => 'ほげ',
                     :service_type => 'vm',
                     :processed => true,
                     :user_id => 1,
        )
        d.save!
        v = Vm.new(
                     :demand_id => d.id,
                     :vm_type_1st => "CentOS 6",
                     :size_of_vm_1st => "M",
                     :number_of_vm_1st => "3",
                     :vm_type_2nd => "Windows Server 2008",
                     :size_of_vm_2nd => "S",
                     :number_of_vm_2nd => "5",
                     :vm_type_3rd => "Windows Server 2003",
                     :size_of_vm_3rd => "M",
                     :number_of_vm_3rd => "7"
        )
        v.save!
        s = Svn.new(
                     :demand_id => d.id,
                     :repo_name => '',
                     :user0_name => '',
                     :user0_pass => '',
                     :added_users => ''
        )
        s.save!
        b = Book.new(
                     :demand_id => d.id,
                     :title => "書籍タイトル",
                     :contact_at_stock => "ふがふが",
                     :date_should_contact => "2012/03/01"
        )
        b.save!
        e = Enquiry.new(
                     :demand_id => d.id,
                     :title => "お問い合わせ",
                     :detail => "ほげほげ"
        )
        e.save!
      end
    end
  end
end
