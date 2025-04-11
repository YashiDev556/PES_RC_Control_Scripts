-- telemetry script for Unmanned - PEP 2025 - @author yashidev556

print("TELEMETRY SCRIPT INITIALIZED")

local SRV_Channels = SRV_Channels


maximum = 3000

function update()
    local rc1 = rc:get_pwm(1)

    if rc1 > 1800 then
        print(string.format("servo output: %d", SRV_Channels:get_output_pwm(96)))
    end


   return update, 5000
end

return update, 1000