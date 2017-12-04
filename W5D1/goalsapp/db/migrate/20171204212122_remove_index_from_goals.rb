class RemoveIndexFromGoals < ActiveRecord::Migration[5.1]
  def change
    remove_index :goals, :name => "index_goals_on_title"
  end
end
