local timeseries = require('timeseries')
local reversegeo = require('reversegeo')

local ts = timeseries.new('log')

local args = app.request:args()
local point = {lat = tonumber(args:get('lat')), lng = tonumber(args:get('lng'))}

local reversegeo_point = reversegeo.reversegeo(point)

ts:insert{location = point, reverse_geo = reversegeo_point}

app.response:set_status(204)
