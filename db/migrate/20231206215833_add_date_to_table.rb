class AddDateToTable < ActiveRecord::Migration[7.1]
  def change
    add_column :presentations, :date, :date
  end
end
