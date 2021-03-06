class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    has_attached_file :avatar,
                    :storage => :s3,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :s3_region => "us-east-1",
                    :default_url => "/images/:style/missing.png",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials
                   }
    
    
  def s3_credentials
    {:bucket => ENV["BUCKET"], :access_key_id => ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"]}
  end
    
    
    
    
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    
    has_many :pictures, :dependent => :destroy
    
end
