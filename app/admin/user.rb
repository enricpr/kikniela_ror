ActiveAdmin.register User do
	scope :topUsers
	permit_params :name, :points, :email

	index do
		column :name, :sortable => :user
		column :points, :sortable => :points
		column :email
		#Afegim accions a Veure, Editar, Borrar
		actions
	end
	
	show do
    attributes_table do
      row :name
			row :points
			row :email
    end
    active_admin_comments
  end
		
	form do |f|
		f.inputs "User details" do
			f.input :name
			f.input :points
			f.input :email
		end
		f.actions
	end
	
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
