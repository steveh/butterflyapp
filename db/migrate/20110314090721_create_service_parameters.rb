class CreateServiceParameters < ActiveRecord::Migration
  def self.up
    create_table :service_parameters do |t|
      t.integer :service_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :service_parameters
  end
end
