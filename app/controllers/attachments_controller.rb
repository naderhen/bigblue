class AttachmentsController < ApplicationController

	def index
		@attachments = Attachment.all
	end

	def create
		@attachment = Attachment.new
		@attachment.purchaseorder_id = params[:purchaseorder_id]
		@attachment.main_file = params[:main_file]
		if @attachment.save
			if params["X-Requested-With"] == "IFrame"
				render :json => @attachment
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