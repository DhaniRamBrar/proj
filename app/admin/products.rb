ActiveAdmin.register Product do
  permit_params :category_id, :name, :description, :price, :stock_available, :sale, :image

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :stock_available
    column :sale
    column "Image" do |product|
      if product.image.attached?
        image_tag product.image, size:"50x50"
      else
        "No image attached"
      end
    end
    actions
  end

  filter :name
  filter :category
  filter :price
  filter :stock_available
  filter :sale

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :stock_available
      f.input :sale
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :category
      row :stock_available
      row :sale
      row :image do |product|
        if product.image.attached?
          image_tag product.image, size: "50x50"
        end
      end
    end
  end
end
