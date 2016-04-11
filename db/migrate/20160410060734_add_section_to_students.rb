class AddSectionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :section_id, :integer
    add_index :students, :section_id
  end
end
