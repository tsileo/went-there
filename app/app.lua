local timeseries = require('timeseries')
local reversegeo = require('reversegeo')

local ts = timeseries.new('log')

-- Are You Tracking Me? will send POST requests that looks like:
-- {"device_id": <Android device ID>, "locations":[{"lat": 1.0, "lng": 1.0, , "ts": <timestamp UTC in ms>}]}
local payload = app.request:body():json()

for _, loc in ipairs(payload.locations) do
  -- Get the reverse geolocation data
  local reversegeo_point = reversegeo.reversegeo(loc)

  loc.device_id = payload.device_id

  -- Insert the event in the "log" timeseries
  ts:insert({location = loc, reverse_geo = reversegeo_point}, loc.ts)
end

-- Returns a 201 Created
app.response:set_status(201)
