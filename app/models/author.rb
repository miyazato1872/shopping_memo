class Author < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'オリジナル' },
    { id: 3, name: 'クックパッド' },
    { id: 4, name: 'DELISH KITCHEN' },
    { id: 5, name: '楽天レシピ' },
    { id: 6, name: 'その他' }
  ]
  end