class ExtendUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, :limit=>50
  	add_column :users, :games_played, :integer, :default=>0
  	add_column :users, :leaderboard_score, :integer, :default=>0
  end
end
