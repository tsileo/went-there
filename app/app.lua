local timeseries = require('timeseries')
local reversegeo = require('reversegeo')

local ts = timeseries.new('log')

local payload = app.request:body():json()

local reversegeo_point = reversegeo.reversegeo(payload)

ts:insert({location = payload, reverse_geo = reversegeo_point}, payload.ts)

app.response:set_status(201)
