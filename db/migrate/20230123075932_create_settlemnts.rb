class CreateSettlemnts < ActiveRecord::Migration[6.0]
  def change
    create_table :settlemnts do |t|

      t.timestamps
    end
  end
end
