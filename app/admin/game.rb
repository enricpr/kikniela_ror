ActiveAdmin.register Game do
	scope :notEnded
	permit_params :team1, :team2, :result, :week
	
	show do
    attributes_table do
      row :team1
			row :team2
			row :result
			row :week
			row :created_at
			row :updated_at
    end
    active_admin_comments
  end
		
	form do |f|
		f.inputs "Game Details" do
			f.input :team1, :as => :select, :collection => Team.all.map {|f| f.name}
			f.input :team2, :as => :select, :collection => Team.all.map {|f| f.name}
			f.input :result, :as => :select, :collection => options_for_bet
			f.input :week
		end
		f.actions
	end

end
