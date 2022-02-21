class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.float :rating
      t.uuid :post_id

      t.timestamps
    end
  end
end
