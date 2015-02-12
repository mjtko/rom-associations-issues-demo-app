class Setup < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :title
    end
    create_join_table :tasks, :workers
  end
end
