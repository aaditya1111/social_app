class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.integer :mobile
      t.index ["user_name"], name: "index_users_sub_on_user_name"

      t.timestamps
    end
  end
end
