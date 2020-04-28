class Admin::HomeController < ApplicationController

	before_action :authenticate_admin! , only:[:top]


	def top
	end

end
