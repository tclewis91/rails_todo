class Todo < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    t.boolean :completed, default:false
    t.boolean  :incomplete, default:true
    t.string :tasks, limit: 300
    t.timestamps null: false
    end
  end
end
