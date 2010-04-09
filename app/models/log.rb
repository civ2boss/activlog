class Log < ActiveRecord::Base
  CONTACT_TYPES = [
    # Displayed      stored in db
    [ "Student",      "Student" ],
    [ "Faculty",      "Faculty" ],
    [ "Staff",        "Staff" ],
    [ "Guest",        "Guest"]
  ]
  
  CATEGORIES = [
    # Displayed             stored in db
    [ "Portal/Blackboard",  "Portal/Blackboard" ],
    [ "CAMS",               "CAMS" ],
    [ "ID/Value Card",      "ID/Value Card" ],
    [ "Other (Specify)",    "Other"]
  ]
  
  validates_presence_of :name, :contact_type, :social_security
  validates_inclusion_of :contact_type, :in => CONTACT_TYPES.map {|disp, value| value}
  validates_inclusion_of :category, :in => CATEGORIES.map {|disp, value| value}
  validates_format_of :social_security, :with => /\A\d{4}\z/, :message => 'must be the last four digits of your social security number'
  validate :social_security_must_be_four_digits
  
  # ===============
  # = CSV support =
  # ===============
  comma do  # implicitly named :default

    updated_at "Time"
    name
    social_security
    contact_type
    category
    description

  end
  
end
