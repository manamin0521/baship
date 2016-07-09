class CreateVistLogs < ActiveRecord::Migration
  def change
	  create_table :vist_logs do |t|
	  t.integer :spot_id
	  t.integer :whether
	  t.integer :group_kind
	  t.integer :season	
      t.timestamps null: false
    end
  end
end
