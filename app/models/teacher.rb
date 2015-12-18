require_relative '../../db/config'

class Teacher < ActiveRecord::Base
validates :email, :format => { :with => /\w+@\w+\.[a-z]{2,}\.?[a-z]*/, message: "Email invalid" }
validates :email, :uniqueness => true

end


