class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :class_hours
      t.integer :student_ids, array: true
      t.integer :instructor_ids, array: true

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
