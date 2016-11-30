class AddUserToBodyMassHistory < ActiveRecord::Migration
  def change
    add_reference :body_mass_histories, :user, index: true, foreign_key: true
  end
end
