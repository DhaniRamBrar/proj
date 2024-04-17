module TaxHelper
  GST_RATE = 0.05
  PST_RATES = {
    'British Columbia' => 0.07,
    'Saskatchewan' => 0.06,
  }
  HST_RATES = {
    'Ontario' => 0.13,
    'Nova Scotia' => 0.15,

  }

  def calculate_taxes(total_price, province_name)
    pst = PST_RATES[province_name] || 0
    hst = HST_RATES[province_name] || 0
    gst = hst > 0 ? 0 : GST_RATE # If HST is applied, GST is not applied
    
    {
      gst: total_price * gst,
      pst: total_price * pst,
      hst: total_price * hst,
      total_tax: total_price * (gst + pst + hst)
    }
  end
end
