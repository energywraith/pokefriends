class CreateAdoptablePokemons < ActiveRecord::Migration[7.1]
  def change
    create_enum :size, %w[small medium large]
    create_enum :temperament, %w[hardy lonely brave relaxed serious modest quiet calm gentle careful quirky]
    create_enum :health_status, %w[healthy special_diet]

    create_table :adoptable_pokemons do |t|
      t.string :name, null: false
      t.references :species, null: false, foreign_key: { to_table: :pokemons }
      t.references :shelter, null: false, foreign_key: { to_table: :shelters }
      t.date :birth_date, null: false
      t.enum :size, enum_type: 'size', null: false
      t.enum :temperament, enum_type: 'temperament', null: false
      t.enum :health_status, enum_type: 'health_status', null: false
      t.text :background, null: false
      t.text :compatibility, null: false

      t.timestamps
    end
  end
end
