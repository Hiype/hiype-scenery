Config = {}

-- Stress relief in %: 1-100
Config.ReliveStressAmount = 20

-- Time to relieve stress again in ms
Config.CooldownTime = 900000 -- 15 minutes

-- For debug reasons - get a green box for the scenery location
Config.DebugPoly = false

-- If for some reason qb-core DrawText doesn't work, uses Notify function instead
Config.UseNotify = true

-- For those who need it, know what this is for
Config.CustomQbBuild = false
Config.BuildName = "qb-core"

-- The last value in vector4 corresponds to heading
-- Inside anim insert animation name from /em menu or number for random type animation
-- 1: Random think animation
-- 2: Random sit animation
-- 3: Random lean bar animation
Config.SceneryLocations = {
    { location = vector4(-415.25, 1161.03, 325.87, 160.99), anim = "inspect" },
    { location = vector4(-523.31, 4194.25, 193.73, 242.85), anim = 1 },
    { location = vector4(501.71, 5603.74, 797.91, 172.68), anim = 1 },
    { location = vector4(2509.0, 3790.39, 51.01, 262.11), anim = 1 },
    { location = vector4(3865.29, 4463.88, 2.72, 267.67), anim = 2, autoCancel = false },
    { location = vector4(-1849.89, -1250.64, 8.62, 140.51), anim = 3, autoCancel = false },
    { location = vector4(297.19, 192.04, 104.28, 332.56), anim = 1 },
    { location = vector4(-3038.29, 23.62, 10.12, 151.51), anim = 3, autoCancel = false }
}

Config.CooldownMessages = {
    "This is getting old...",
    "*yawn*",
    "Enough with these views",
    "No"
}
