class CreateVisitLogs < ActiveRecord::Migration
  def change
    create_table :visit_logs do |t|
      t.integer :spot_id
      t.integer :weather
      t.string :group_kind
      t.string :integer
      t.string :season
      t.string :integer

      t.timestamps null: false
    end
  end
end
