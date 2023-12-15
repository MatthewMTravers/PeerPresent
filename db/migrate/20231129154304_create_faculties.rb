class CreateFaculties < ActiveRecord::Migration[7.1]
  def change
    create_table :faculties do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      
      t.timestamps
    end
  end
end
