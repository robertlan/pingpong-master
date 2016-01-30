class ExtendUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, :limit=>50
  	add_column :users, :games_played, :integer
  	add_column :users, :leaderboard_score, :integer
  end
end
