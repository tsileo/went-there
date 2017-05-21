print('went-there')
ts = require('timeseries').new('lol')
rg = require('reversegeo')

place = rg.reversegeo{lat = 30.2671, lng = -87.74306}
print(place.data.city_name)
print(place.lat)
print(place.lng)
ts:insert({omg = 2}, 5)
data, _ = ts:range(-1, 0)
print(data)
for i = 1, #data do
  print(data[i].time)
  print(data[i].data.omg)
end
app.response:write('hello')
print('ol')
