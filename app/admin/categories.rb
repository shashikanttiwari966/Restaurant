ActiveAdmin.register Category do
  permit_params :name, :gst, :tax

  form do |f|
    f.inputs do
      input :name
      input :gst
      input :tax
    end
    f.actions
  end
  
end
