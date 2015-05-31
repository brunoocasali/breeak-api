class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :bio
      t.date :birthday_at
      t.string :email
      t.references :location, index: true, foreign_key: true
      t.string :name
      t.references :status, index: true, foreign_key: true
      t.string :fb_access_token

      t.timestamps null: false
    end
  end
end
