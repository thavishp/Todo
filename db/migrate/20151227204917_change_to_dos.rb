class ChangeToDos < ActiveRecord::Migration
  def change
  	rename_column("to_dos", "name", "title")
  	add_column("to_dos", "content", :string, after: "title")
  end
end
