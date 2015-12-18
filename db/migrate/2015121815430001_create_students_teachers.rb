require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudentsTeachers < ActiveRecord::Migration
  def change
  	create_table :students_teachers do |t|
      t.string :student_id
      t.string :teacher_id
      t.timestamps null: false
    end
  end
end
