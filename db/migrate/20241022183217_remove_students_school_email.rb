class RemoveStudentsSchoolEmail < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :student_email, :string
  end
end
