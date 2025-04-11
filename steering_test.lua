-- steering test script for Unmanned - PEP 2025 - @author yashidev556

print("INITIALIZED SCRIPT")


local rc = rc
-- local ahrs = ahrs
local SRV_Channels = SRV_Channels


maximum = 3000

output_speed = 10

function update()
    local current_pos = ahrs:get_location()
    -- local home = ahrs:get_home()

    local controlC = rc:get_pwm(14) -- change this to be the same channels as C and D
    local controlD = rc:get_pwm(15)

    if controlC > 1500 then
        SRV_Channels:set_output_pwm(94, output_speed) -- set the servo assigned function 96 (scripting1) to a proportional value
    end

    if controlD > 1500 then
        SRV_Channels:set_output_pwm(94, -output_speed) -- scripting1
    end
    
    return update, 50 -- call again in some amount of milliseconds
end

return update, 1000