class EventType < ActiveRecord::Migration
  def change
  	create_table :event_types do |t|
      t.string :name, null: false
		end
  end
end
