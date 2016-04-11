class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :grade

      t.timestamps null: false
    end
  end
end
