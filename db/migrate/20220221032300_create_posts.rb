class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :title
      t.string :content
      t.string :author_ip
      t.uuid :user_id
      t.index ["title", "author_ip"], name: "index_posts_sub_on_posts_and_on_author_ip"

      t.timestamps
    end
  end
end
