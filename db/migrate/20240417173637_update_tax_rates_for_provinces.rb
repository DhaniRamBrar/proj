class UpdateTaxRatesForProvinces < ActiveRecord::Migration[7.1]
  def up
    Province.where(name: 'Alberta').update_all(gst: 5.0, pst: 0.0, hst: 0.0)
    Province.where(name: 'British Columbia').update_all(gst: 5.0, pst: 7.0, hst: 0.0)
    Province.where(name: 'Manitoba').update_all(gst: 5.0, pst: 7.0, hst: 0.0)
    Province.where(name: 'New Brunswick').update_all(gst: 0.0, pst: 0.0, hst: 15.0)
    Province.where(name: 'Newfoundland and Labrador').update_all(gst: 0.0, pst: 0.0, hst: 15.0)
    Province.where(name: 'Nova Scotia').update_all(gst: 0.0, pst: 0.0, hst: 15.0)
    Province.where(name: 'Ontario').update_all(gst: 0.0, pst: 0.0, hst: 13.0)
    Province.where(name: 'Prince Edward Island').update_all(gst: 0.0, pst: 0.0, hst: 15.0)
    Province.where(name: 'Quebec').update_all(gst: 5.0, pst: 9.975, hst: 0.0)
    Province.where(name: 'Saskatchewan').update_all(gst: 5.0, pst: 6.0, hst: 0.0)
  end

  def down
    Province.update_all(gst: nil, pst: nil, hst: nil)
  end
end
