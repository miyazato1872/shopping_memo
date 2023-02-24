class FoodCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'お米系' },
    { id: 3, name: '麺類' },
    { id: 4, name: '主菜' },
    { id: 5, name: '副菜' },
    { id: 6, name: '汁物' },
    { id: 7, name: 'その他' }
  ]
  end