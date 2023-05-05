class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :page, null: false, foreign_key: true
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
