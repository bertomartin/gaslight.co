module TrainingApp
  class CourseSerializer < ActiveModel::Serializer
    attributes :id, :title

    has_many :sections
    embed :ids, include: true
  end
end