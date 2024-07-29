class Adoption < ApplicationRecord
  enum city: {
    pallet_town: 'pallet_town',
    viridian_city: 'viridian_city',
    pewter_city: 'pewter_city',
    cerulean_city: 'cerulean_city',
    vermilion_city: 'vermilion_city',
    lavender_town: 'lavender_town',
    celadon_city: 'celadon_city',
    fuchsia_city: 'fuchsia_city',
    saffron_city: 'saffron_city',
    cinnabar_island: 'cinnabar_island'
  }

  enum household_ownership: {
    rent: 'rent',
    own: 'own'
  }

  belongs_to :adoptable_pokemon

  validates :adoptable_pokemon, presence: true
  validates :full_name, presence: true
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true,
                           format: { with: /\A\+?[\d\s\-()]{7,15}\z/, message: 'should be a valid phone number' }
  validates :city, presence: true, inclusion: { in: cities.keys }
  validates :household_ownership, presence: true, inclusion: { in: household_ownerships.keys }
  validates :household_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :household_children, presence: true
  validates :has_experience, inclusion: { in: [true, false] }
  validates :why_adopt_pokemon, presence: true
  validates :desired_pokemon_traits, presence: true
end
