class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,          null: false, default: ""
      t.string :slug,           null: false, default: ""

      t.timestamps
    end
    add_index :posts, :slug,    unique: true
  end
end
