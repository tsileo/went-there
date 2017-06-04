local timeseries = require('timeseries')
local reversegeo = require('reversegeo')

local ts = timeseries.new('log')

-- Are You Tracking Me? will send POST requests that looks like:
-- {"lat": 1.0, "lng": 1.0, "device_id": <Android device ID>, "ts": <timestamp UTC in ms>}
local payload = app.request:body():json()

-- Get the reverse geolocation data
local reversegeo_point = reversegeo.reversegeo(payload)

-- Insert the event in the "log" timeseries
ts:insert({location = payload, reverse_geo = reversegeo_point}, payload.ts)

-- Returns a 201 Created
app.response:set_status(201)
