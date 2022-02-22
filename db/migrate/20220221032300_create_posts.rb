class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :title
      t.string :content
      t.string :author_ip
      t.float :average_rating, default: 0.0
      t.integer :rating_numbers, default: 0
      t.uuid :user_id
      t.index ["title", "author_ip"], name: "index_posts_sub_on_posts_and_on_author_ip"

      t.timestamps
    end
  end
end
