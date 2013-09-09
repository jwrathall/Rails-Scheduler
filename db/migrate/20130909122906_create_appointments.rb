class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user
      t.integer :user_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :is_all_day

      t.timestamps
    end
    add_index :appointments, :user_id
  end
end
