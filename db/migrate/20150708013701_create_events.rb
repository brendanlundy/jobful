class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.references :job_application, index: true, foreign_key: true, null: false
    	t.references :event_type, foreign_key: true, null: false
    	t.datetime :event_time
    	t.text :pre_notes
      t.text :post_notes

      t.timestamps null: false
    end
  end
end
