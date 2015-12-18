require_relative '../../db/config'

class Student < ActiveRecord::Base
	has_many :students_teachers
	has_many :teachers, through: :students_teachers
# implement your Student model here
validates :email, :format => { :with => /\w+@\w+\.[a-z]{2,}\.?[a-z]*/, message: "Email invalid" }
validates :email, :uniqueness => true
validates :age, :numericality => { :greater_than => 5 }
validates :phone, :format => { :with => /.*\d+.*\d+.*\d+.*\d+.*\d+.*\d+.*\d+.*\d+.*\d+.*\d+.*/ }

	def name
		return self.first_name + " " + self.last_name
	end

	def age
		now = Date.today
    return age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
	end

end