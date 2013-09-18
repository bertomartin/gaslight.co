module TrainingApp
  class SectionSerializer < ActiveModel::Serializer
    attributes :id, :title

    has_many :chapters
    embed :ids, include: true
  end
end