class AdddStatusToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :status, :boolean, default: false
  end
end
