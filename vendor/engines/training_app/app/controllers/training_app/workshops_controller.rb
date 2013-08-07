module TrainingApp
  class WorkshopsController < InheritedResources::Base

    respond_to :json, :html

    expose(:workshops)

    def index
      featured_workshop = current_or_last_workshop
      respond_with workshops
    end

    def show
      respond_with workshop
    end

    def current_workshop?
      current_workshop.present?
    end
    helper_method :current_workshop?

    def workshop
      @workshop ||= Workshop.by_slug(params[:id])
    end
    helper_method :workshop

    def current_workshop
      @current_workshop ||= Workshop.current
    end

    def current_or_last_workshop
      current_workshop? ? current_workshop : Workshop.order('created_at desc').first
    end
  end
end

