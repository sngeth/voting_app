class AddVotesToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :votes, :integer
  end
end
