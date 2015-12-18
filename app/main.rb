require_relative './models/student'
require_relative './models/teacher'

studentperteacher = 0
studentperteacher = Student.count / Teacher.count
if Student.count % Teacher.count != 0 then studentperteacher += 1 end

teacherids = []

Teacher.find_each do |eachteacher|
	teacherids << eachteacher.id
end

Student.find_in_batches(batch_size: studentperteacher) do |studentarray|
	currentteacher = teacherids.shift
	studentarray.each do |x|
		Student.update(x.id,
			{ teacher_id: currentteacher }
	)
	end
end
