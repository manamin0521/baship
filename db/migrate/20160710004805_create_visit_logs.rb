class CreateVisitLogs < ActiveRecord::Migration
  def change
    create_table :visit_logs do |t|
      t.integer :spot_id
      t.integer :weather
      t.integer :group_kind
      t.integer :season

      t.timestamps null: false
    end
  end
end
