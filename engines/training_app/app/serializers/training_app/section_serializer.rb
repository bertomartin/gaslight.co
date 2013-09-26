module TrainingApp
  class SectionSerializer < ActiveModel::Serializer
    attributes :id, :course_id, :title

    has_many :chapters
    embed :ids, include: true
  end
end