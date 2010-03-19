class Log < ActiveRecord::Base
  CONTACT_TYPES = [
    # Displayed      stored in db
    [ "Student",      "Student" ],
    [ "Faculty",      "Faculty" ],
    [ "Staff",        "Staff" ],
    [ "Guest",        "Guest"]
  ]
  
  validates_presence_of :name, :contact_type, :description, :social_security
  validates_inclusion_of :contact_type, :in => CONTACT_TYPES.map {|disp, value| value}
  validates_numericality_of :social_security
  validate :social_security_must_be_four_digits
  
protected
  def social_security_must_be_four_digits
    errors.add(:social_security, 'must be the last four digits of your social security number') if social_security.nil? || social_security < 1000
  end
  
end
