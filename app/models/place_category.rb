class PlaceCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '冷蔵/冷凍食材' },
    { id: 3, name: '常温食材/消耗備品' },
    { id: 4, name: '風呂/トイレ/洗面所' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items
  end