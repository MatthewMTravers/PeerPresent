class RemoveDateFromTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :presentations, :date
  end
end
