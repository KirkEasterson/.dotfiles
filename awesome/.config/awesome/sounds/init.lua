local M = {}

function M.init(sounds)
	if sounds == nil then
		return
	end


	-- local prev_batt_state = ""
	-- require("awful").widget.watch(
	-- 	"cat /sys/class/power_supply/BAT0/status",
	-- 	15,
	-- 	function(_, stdout)
	-- 		local parsed_stdout = string.lower(string.gsub(stdout, '^%s*(.-)%s*$', '%1'))
	-- 		if stdout ~= prev_batt_state then
	-- 			prev_batt_state = stdout
	-- 			if (stdout == "charging") then
	-- 				require("awful").spawn.with_shell("paplay " .. sounds.battery_charging)
	-- 			elseif (stdout == "discharging") then
	-- 				require("awful").spawn.with_shell("paplay " .. sounds.battery_discharging)
	-- 			end
	-- 		end
	-- 	end
	-- )

	do
		awesome.connect_signal("startup", function()
			require("awful").spawn.with_shell("paplay " .. sounds.startup)
		end)

		awesome.connect_signal("exit", function()
			require("awful").spawn.with_shell("paplay " .. sounds.logoff)
		end)

		awesome.connect_signal("debug::error", function()
			require("awful").spawn.with_shell("paplay " .. sounds.error)
		end)

		awesome.connect_signal("lowered", function()
			require("awful").spawn.with_shell("paplay " .. sounds.minimize)
		end)

		awesome.connect_signal("raised", function()
			require("awful").spawn.with_shell("paplay " .. sounds.restore)
		end)
	end
end

return M
