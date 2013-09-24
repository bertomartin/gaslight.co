module TrainingApp
  class ChapterSerializer < ActiveModel::Serializer
    attributes :id, :title, :order, :description, :video_url, :code_url, :poster_url, :section_id

    def attributes
      attrs = super
      if registration.nil? && !object.demo?
        [:code_url, :video_url, :poster_url].each { |attr| attrs[attr] = nil}
      end
      attrs
    end
  end
end