ActiveAdmin.register Bet do
	permit_params :user_id, :game_id, :week, :hit, :tip

	index do
		selectable_column
		column :user, :sortable => :user
		column :game #do |bet|
			#link_to((game_teams bet.game), admin_game_path(bet.game))
		#end
		column :week, :sortable => :week
		column :tip
		column :hit
		column :created_at
		column :updated_at
		#Afegim accions a Veure, Editar, Borrar
		actions
	end
	
	show do
    attributes_table do
      row :user
      row :game do |bet|
				"#{bet.game.team1} - #{bet.game.team2}"
			end
			row :week
			row :tip
			row :hit
			row :created_at
			row :updated_at
    end
    active_admin_comments
  end
		
	form do |f|
		f.inputs "Bet Details" do
			f.input :user
			f.input :game
			f.input :week
			f.input :tip, :as => :select, :collection => options_for_tip
			if !f.object.new_record?
				f.input :hit
			end
		end
		f.actions
	end
		
end
