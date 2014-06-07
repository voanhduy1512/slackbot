class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :code
      t.text :sample_params

      t.timestamps
    end
  end
end
