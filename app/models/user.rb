class User < ActiveRecord::Base
  has_many :demands

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  validates :username, :uniqueness => { :case_sensitive => false },
                       :length     => { :in => 1..20 }
                       #:format     => { :with => /^[a-z0-9_]+$/ }
  validates :email,    :uniqueness => { :case_sensitive => false },
                       :length     => { :in => 3..420 }

end
