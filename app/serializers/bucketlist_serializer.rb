class BucketlistSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :items do
    for item in object.items
      ItemSerializer.new(item).attributes
    end
  end
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute (:user_id).to_s, key: :created_by
end