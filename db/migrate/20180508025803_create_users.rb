class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :name
      t.string :oauth_token
      t.string :oauth_token_secret
    end
  end
end
