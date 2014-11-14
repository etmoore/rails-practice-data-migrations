class DataCleanup < ActiveRecord::Migration
  def change
    Organization.where(active: nil).update_all(active: false)
    Organization.where(name: nil).destroy_all
    Person.where("date_of_birth <= ?", 100.years.ago).destroy_all
  end
end
