class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :d1
      t.string :d2
      t.string :desert

      t.timestamps null: false
    end
  end
end
