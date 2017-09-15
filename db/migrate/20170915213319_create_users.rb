class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :grade
      t.string :interests
      t.string :strengths
      t.string :aspirations
      t.date :date

      t.timestamps
    end
  end
end
