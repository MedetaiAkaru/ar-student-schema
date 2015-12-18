require_relative '../../db/config'

class StudentTeacher < ActiveRecord::Base
	belongs_to :students
	belongs_to :teachers
validates :email, :format => { :with => /\w+@\w+\.[a-z]{2,}\.?[a-z]*/, message: "Email invalid" }
validates :email, :uniqueness => true

end