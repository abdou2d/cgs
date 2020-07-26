class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name,        null: false, default: ""
      t.string :last_name,         null: false, default: ""
      t.string :country,         null: false, default: ""
      t.string :slug,           null: false, default: ""
      t.datetime :birthday
      t.string :facebook,           null: false, default: ""
      t.string :twitter,           null: false, default: ""
      t.string :site,           null: false, default: ""

      t.references :user, foreign_key: true
      
      t.timestamps
    end
    add_index :profiles, :slug,    unique: true
  end
end
