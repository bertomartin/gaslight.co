module TrainingApp
  class CourseSerializer < ActiveModel::Serializer
    attributes :id, :title

    has_many :sections
    embed :ids, include: true

    def attributes
      attrs = super
      attrs[:demo] = true if registration.blank?
      attrs
    end
  end
end