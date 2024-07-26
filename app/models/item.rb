class Item < ApplicationRecord
  has_many :evolution

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/#{name.downcase.gsub(' ', '-')}.png"
  end
end
