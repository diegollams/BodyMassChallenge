class BodyMassHistory < ActiveRecord::Base
  paginates_per 10
  
  def category
    if body_mass <= 15
      'Very severely underweight'
    elsif body_mass <= 16
      'Severely underweight'
    elsif body_mass <= 18.5
      'Underweight'
    elsif body_mass <= 25
      'Normal  healthy weight'
    elsif body_mass <= 30
      'Overweight'
    elsif body_mass <= 35
      'Obese Class I  (Moderately obese)'
    elsif body_mass <= 40
      'Obese Class II  (Severely obese)'
    else
      'Obese Class III  (Very severely obese)'
    end
  end
end
