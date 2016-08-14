class AddDefaultToVotes < ActiveRecord::Migration
  def change
    change_column_default :choices, :votes, default: 0
  end
end
