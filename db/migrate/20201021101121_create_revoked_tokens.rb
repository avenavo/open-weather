class CreateRevokedTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :revoked_tokens do |t|
      t.string :token, null: false
      t.timestamps
    end

    add_index :revoked_tokens, :token
  end
end
