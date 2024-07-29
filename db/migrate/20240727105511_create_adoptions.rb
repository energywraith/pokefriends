class CreateAdoptions < ActiveRecord::Migration[7.1]
  create_enum :city,
              %w[pallet_town viridian_city pewter_city cerulean_city vermilion_city lavender_town celadon_city fuchsia_city
                 saffron_city cinnabar_island]

  create_enum :household_ownership, %w[rent own]

  def change
    create_table :adoptions do |t|
      t.string :full_name
      t.string :email_address
      t.string :phone_number
      t.enum :city, enum_type: 'city'
      t.enum :household_ownership, enum_type: 'household_ownership'
      t.integer :household_size
      t.string :household_children
      t.boolean :has_experience
      t.text :why_adopt_pokemon
      t.text :desired_pokemon_traits
      t.boolean :pending, default: true
      t.references :adoptable_pokemon, null: false, foreign_key: { to_table: :adoptable_pokemons }

      t.timestamps
    end
  end
end
