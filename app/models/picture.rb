class Picture < ApplicationRecord
    
    belongs_to :user
    
    
    has_attached_file :image,
                    :storage => :s3,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :s3_region => "us-east-1",
                    :default_url => "/images/:style/missing.png",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials
                   }
    
    
    
  def s3_credentials
    {:bucket => ENV["BUCKET"], :access_key_id => ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"]}
  end

  do_not_validate_attachment_file_type :image
    
    
end
