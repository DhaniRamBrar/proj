ActiveAdmin.register Province do
  permit_params :name, :hst, :gst, :pst
  index do
    selectable_column
    id_column
    column :name
    column "HST Rate (%)", :hst
    column "GST Rate (%)", :gst
    column "PST Rate (%)", :pst
    actions
  end
  filter :name
  filter :hst
  filter :gst
  filter :pst
  show do
    attributes_table do
      row :name
      row "HST Rate (%)" do |province|
        number_to_percentage(province.hst, precision: 2) unless province.hst.nil?
      end
      row "GST Rate (%)" do |province|
        number_to_percentage(province.gst, precision: 2) unless province.gst.nil?
      end
      row "PST Rate (%)" do |province|
        number_to_percentage(province.pst, precision: 2) unless province.pst.nil?
      end
    end
    active_admin_comments
  end
  form do |f|
    f.inputs 'Province Details' do
      f.input :name
      f.input :hst, label: 'HST Rate (%)', hint: 'Enter HST rate if applicable. Leave blank otherwise.'
      f.input :gst, label: 'GST Rate (%)', hint: 'Enter GST rate if applicable. Leave blank otherwise.'
      f.input :pst, label: 'PST Rate (%)', hint: 'Enter PST rate if applicable. Leave blank otherwise.'
    end
    f.actions  
  end
end
