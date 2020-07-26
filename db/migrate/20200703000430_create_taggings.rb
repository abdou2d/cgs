class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :episode
      t.references :tag

      t.timestamps
    end
    add_index :taggings, [:episode_id, :tag_id]
  end
end
