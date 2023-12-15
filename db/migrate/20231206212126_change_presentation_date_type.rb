class ChangePresentationDateType < ActiveRecord::Migration[7.1]
  def change
    change_column :presentations, :date, :date
  end
end
