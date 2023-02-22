class StudentSerializer < ActiveModel::Serializer
  attributes :id,:name,:age,:instructor_id,:major
  belongs_to :instructor
end
