class AdoptablePokemon < ApplicationRecord
  belongs_to :shelter
  belongs_to :species, class_name: 'Pokemon'

  def age
    return 'Young' unless @birth_date

    today = Date.today
    birth_date_obj = Date.parse(@birth_date)

    age_years = today.year - birth_date_obj.year
    age_years -= 1 if today < birth_date_obj + age_years.years

    young_threshold = 5
    adult_threshold = 10

    if age_years < young_threshold
      'Young'
    elsif age_years < adult_threshold
      'Adult'
    else
      'Mature'
    end
  end

  def health
    case health_status
    when 'special_diet'
      'Requires special diet'
    else
      'Healthy'
    end
  end
end
