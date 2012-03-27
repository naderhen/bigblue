require 'csv'
class AttachmentsController < ApplicationController

	def index
		@attachments = Attachment.all
	end

	def create
		@attachment = Attachment.new
		@attachment.purchaseorder_id = params[:purchaseorder_id]
		@purchaseorder = Purchaseorder.find(params[:purchaseorder_id])
		@attachment.main_file = params[:main_file]

		if @attachment.save
			if params["X-Requested-With"] == "IFrame"
				if @attachment.main_file.format == :csv
					@file = File.read(params[:main_file].tempfile)
					@csv = CSV.parse(@file) do |row|
						@purchaseorder.items.create box_number: row[0], item_number: row[1], weight: row[2], code: row[3], cost: row[4], grade_notes: row[5], comments: row[6]
					end
					render :json => {:attachment => @attachment, :csv => @csv}
				else
					render :json => @attachment
				end
				
			else
				respond_to do |format|
					format.html {
						render :json => @attachment.to_json,
								:content_type => 'text/html',
								:layout => false
					}
					format.json {
						render :json => @attachment
					}
				end
			end
		else
			render :json => [{:error => "custom_failure"}], :status => 304
		end
	end

	def destroy
		@attachment = Attachment.find(params[:id])
		@attachment.destroy
		render :json => true
	end
end