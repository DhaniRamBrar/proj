ActiveAdmin.register Order do
  permit_params :user_id, :status, :address, :grand_total, :province_id, :hst,:pst,:gst
  index do
    selectable_column
    id_column
    column :user do |order|
      order.user.email
    end
    column :status
    column :address
    column :hst
    column :pst
    column :gst
    column :grand_total
    column "Products" do |order|
      ul do
        order.order_items.each do |item|
          li do
            "#{item.quantity}x #{item.product.name} at #{number_to_currency(item.price)} each"
          end
        end
      end
    end
    actions
  end

  # Filters
  filter :user_email, as: :string
  filter :status
  filter :address
  filter :grand_total

  # Show page
  show do
    attributes_table do
      row :user do |order|
        order.user.email
      end
      row :status
      row :address
      row :hst
      row :pst
      row :gst
      row :grand_total
      row :created_at
      row :updated_at
      panel "Products" do
        table_for order.order_items do
          column "Product" do |item|
            item.product.name
          end
          column :quantity
          column :price do |item|
            number_to_currency(item.product.price)
          end
          column "Subtotal" do |item|
            number_to_currency(item.quantity * item.product.price)
          end
        end
      end
    end
  end


  form only: :edit do |f|
    f.inputs "Edit Order Status" do
      f.input :status, as: :select, collection: ['pending', 'new', 'paid', 'shipped'], include_blank: false
    end
    f.actions
  end
end
