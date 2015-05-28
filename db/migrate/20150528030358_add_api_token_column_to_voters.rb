class AddApiTokenColumnToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :api_token, :string
  end
end
