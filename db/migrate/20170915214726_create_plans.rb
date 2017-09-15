class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.text :affective_goal
      t.text :academic_goal
      t.text :task
      t.text :measure
      t.text :actions
      t.text :purpose
      t.date :deadline

      t.timestamps
    end
  end
end
