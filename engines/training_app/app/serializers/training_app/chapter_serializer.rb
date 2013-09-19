module TrainingApp
  class ChapterSerializer < ActiveModel::Serializer
    attributes :id, :title, :title, :order, :description, :video_url, :code_url, :poster_url, :section_id
  end
end