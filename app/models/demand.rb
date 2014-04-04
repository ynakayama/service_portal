class Demand < ActiveRecord::Base
  belongs_to :user

  has_many :vms
  has_many :svns
  has_many :books
  has_many :enquiries

  validates :badge, :presence => true,
                    :length => {:minimum => 6, :maximum => 6},
                    :format => {:with => /\d{6}/}
  validates :name,  :presence => true,
                    :length => {:minimum => 1, :maximum => 140}
  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 420},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :contacts, :presence => true,
                       :length => {:minimum => 1, :maximum => 140}

# validates :project_name, :presence => false,
#                          :length => {:minimum => 0, :maximum => 140}

# validates :badge_b, :presence => true,
#                     :length => {:minimum => 6, :maximum => 6},
#                     :format => {:with => /\d{6}/}
# validates :name_b,  :presence => true,
#                     :length => {:minimum => 1, :maximum => 140}
# validates :email_b, :presence => true,
#                     :length => {:minimum => 3, :maximum => 420},
#                     :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

# validates :start_date, :presence => true,
#                   :format => {:with => /\d{4}\/\d{1,2}\/\d{1,2}/}
# validates :end_date, :presence => true,
#                   :format => {:with => /\d{4}\/\d{1,2}\/\d{1,2}/}

# validates :ip, :presence => false,
#                :length => {:minimum => 0, :maximum => 140}

# validates :purpose, :presence => false,
#                     :length => {:minimum => 0, :maximum => 420}

# validates :message, :presence => false,
#                     :length => {:minimum => 0, :maximum => 420}

end
