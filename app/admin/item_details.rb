ActiveAdmin.register ItemDetail do
  permit_params :name, :image, :category_id
  before_action :authorization, only: [:new, :create, :edit, :destroy, :update]

  index do
    selectable_column
    id_column
    column :name
    column "Category" do |item|
      item.category.name
    end
    column "Image" do |item|
      image_tag item.image, width: 100 if item.image.attached?
    end

    actions if current_user.admin?
  end

  form do |f|
    f.inputs do
      input :name
      input :image, as: :file
      input :category_id, as: :select, :collection => Category.all.map{|cat| [cat.name, cat.id]}#, input_html: { class: 'inline-checkboxes' }, include_blank: false
    end
    f.actions
  end

  controller do
    def authorization
      # authorize resource
    end
  end
  
end
