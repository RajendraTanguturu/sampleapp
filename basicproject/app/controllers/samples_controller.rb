class SamplesController < ApplicationController

	def new
		@sample = Sample.new

	end

	def create 
		@sample = Sample.new(sample_params)
		if @sample.save
			flash[:notice] = "Sample created sucessfullly!"
			redirect_to sample_path(@sample)
		else
			render 'new'
		end
	end

	def show
		@sample = Sample.find(params[:id])
	end

	def edit
		@sample = Sample.find(params[:id])
	end

	def update
		@sample = Sample.find(params[:id])
		if @sample.update(sample_params)
			flash[:notice] = "Sample was successfully updated"
			redirect_to sample_path(@sample)
		else
			render 'edit'
		end

	end

	private
		def sample_params
			params.require(:sample).permit(:name, :description)

		end

end