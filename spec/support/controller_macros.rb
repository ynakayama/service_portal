module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin = User.create(
                 :username => 'system',
                 :email => 'tech-sp@dts.co.jp',
                 :password => ',bgOPi#1',
                 :password_confirmation=> ',bgOPi#1'
      )
      # @admin.confirm!
      sign_in @admin
    end
  end
end
