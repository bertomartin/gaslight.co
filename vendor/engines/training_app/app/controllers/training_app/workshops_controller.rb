module TrainingApp
  class WorkshopsController < InheritedResources::Base

    respond_to :json, :html

    expose(:current_workshop) { Workshop.current }
    expose(:current_workshop?) { current_workshop.present? }
    expose(:workshops)
    expose(:workshop) { Workshop.by_slug(params[:id]) }
    expose(:featured_workshop) {  current_or_last_workshop }

    private

    def current_or_last_workshop
      current_workshop || Workshop.order('created_at desc').first
    end
  end
end

