class CreateApiClients < ActiveRecord::Migration
  def change
    create_table :api_clients do |t|
      t.text :token
      t.text :refresh_token
      t.datetime :token_expires_at

      t.timestamps
    end
  end
end
