class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_hiking_distance
    trails.sum(:length)
  end

  def total_hike_count
    trails.count
  end

  def average_hiking_distance
    if total_hike_count > 0
      total_hiking_distance/total_hike_count
    else
      total_hiking_distance
    end
  end

  def longest_trail
    trails.order(length: :desc).first
  end
end
