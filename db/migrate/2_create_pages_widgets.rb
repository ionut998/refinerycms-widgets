class CreatePagesWidgets < ActiveRecord::Migration
  def change
     create_table :refinery_pages_widgets do |t|
      t.references :page
      t.references :widget
      t.string :location
      t.integer :position
      
      t.timestamps
    end
  end
end
