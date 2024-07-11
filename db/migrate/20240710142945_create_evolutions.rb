class CreateEvolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :evolutions do |t|
      t.integer :pokemon_id
      t.integer :evolution_pokemon_id
      t.integer :level
      t.references :item, foreign_key: { to_table: :items }
      t.boolean :by_trade

      t.timestamps
    end
  end
end
