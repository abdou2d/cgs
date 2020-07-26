class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :video,          null: false, default: ""
      t.string :paid_video,          null: false, default: ""
      t.string :title,          null: false, default: ""
      t.string :slug,          null: false, default: ""
      t.string :set,          null: false, default: ""
      t.datetime :published_at

      t.timestamps
    end
    add_index :episodes, :slug,    unique: true
  end
end
