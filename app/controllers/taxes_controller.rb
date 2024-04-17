class TaxesController < ApplicationController
  def rates
    province = Province.find(params[:province_id])
    render json: { gst: province.gst.to_f, pst: province.pst.to_f, hst: province.hst.to_f }
  end
end
