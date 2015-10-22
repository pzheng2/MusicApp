class Band < ActiveRecord::Base

  has_many(
    :albums,
    dependent: :destroy,
    class_name: "Album",
    foreign_key: :band_id,
    primary_key: :id
  )

end
