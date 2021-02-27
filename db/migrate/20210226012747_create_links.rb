class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.references :user
      t.text :url
      t.text :slug, null: false, index: {unique: true}
      t.timestamps
    end
  end
end
