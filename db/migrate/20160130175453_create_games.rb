class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.datetime :date_played
    	t.integer	:winning_user_id
    	t.integer	:losing_user_id
    	t.integer	:winning_user_score
    	t.integer	:losing_user_score
      t.timestamps null: false
    end
  end
end
