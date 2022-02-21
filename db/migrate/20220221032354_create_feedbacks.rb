class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :comment
      t.uuid :user_id
      t.uuid :post_id
      t.uuid :owner_id
      t.index ["user_id", "owner_id"], name: "index_feedbacks_on_user_id_and_owner_id"

      t.timestamps
    end
  end
end
