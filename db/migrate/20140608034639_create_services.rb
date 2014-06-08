class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :slug
      t.text :text
      t.text :attachments
      t.text :helper_methods
      t.text :sample_params

      t.timestamps
    end
  end
end
