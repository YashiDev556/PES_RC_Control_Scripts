-- throttle script for Unmanned - PEP 2025 - @author yashidev556

print("INITIALIZED SCRIPT")

local v = 0
local rc = rc
local ahrs = ahrs
local SRV_Channels = SRV_Channels
local arming = arming


maximum = 3000

function update()
    local current_pos = ahrs:get_location()
    local home = ahrs:get_home()

    local rc5 = rc:get_pwm(5)   
    local rc16 = rc:get_pwm(16)

    if rc16 > 1500 and arming:is_armed() then
        dv = 25
    elseif rc16 < 1500 then
        dv = -25
    end

    --cutting the throttle
    if rc5 > 1550 then
        v = 0
        dv = 0
    end

    if rc5 < 1450 then
        dv = -50
    end

    v = v + dv

    -- setting the maximum and minimum v
    if v < 0 then
        v = 0
    end

    if v > maximum then
        v = maximum
    end

    SRV_Channels:set_output_pwm(96, v) -- set the servo assigned function 96 (scripting3) to a proportional value

    return update, 50 -- call again in the specified amount of milliseconds
end

return update, 1000