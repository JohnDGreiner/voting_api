class AddApiTokenColumnToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Api_Token, :string
  end
end
