class RoomsController < ApplicationController

	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			redirect_to @room, notice: 'Quarto cadastrado'
		else
			render action: :new
		end
	end

	def show
		@room = Room.find(params[:id])
	end

	private
	def room_params
		params.require(:room).permit(:title, :location, :description) 
	end
end