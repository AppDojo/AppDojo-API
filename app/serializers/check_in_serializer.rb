class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :meeting_id
end
