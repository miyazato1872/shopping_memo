class FoodGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '鶏肉' },
    { id: 3, name: '牛肉' },
    { id: 4, name: '豚肉' },
    { id: 5, name: '魚' },
    { id: 6, name: '野菜' },
    { id: 7, name: 'その他' }
  ]
  end