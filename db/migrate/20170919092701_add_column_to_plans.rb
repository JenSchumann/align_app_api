class AddColumnToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :title, :string
  end
end
