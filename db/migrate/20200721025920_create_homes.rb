class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :title
      t.string :menu

      t.timestamps
    end
  end
end
