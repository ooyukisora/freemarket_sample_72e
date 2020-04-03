class Condition < ActiveHash::Base
  self.data = [
      {name: '新品,未使用'}, {name: '未使用に近い'}, {name: '目立った傷や汚れなし'},
      {name: 'やや傷, 汚れあり'}, {name: '汚れあり'}, {name: '状態が悪い'},   
  ]
end