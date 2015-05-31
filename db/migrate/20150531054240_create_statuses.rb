class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :person, index: true, foreign_key: true
      t.date :last_logged_at

      t.timestamps null: false
    end
  end
end
