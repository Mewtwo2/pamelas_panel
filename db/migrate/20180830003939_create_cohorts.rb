class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :instructor_id
      t.string :students, array: true

      t.timestamps
    end
  end
end