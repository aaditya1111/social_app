class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :mobile
      t.index ["email"], name: "index_users_sub_on_email"

      t.timestamps
    end
  end
end
