local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestEZ = require(ReplicatedStorage.DevPackages.TestEZ)

local function test()
	print()
	local completed, result = xpcall(function()
		local results = TestEZ.TestBootstrap:run({ ReplicatedStorage.tests })
		return results.failureCount == 0
	end, debug.traceback)
	print()
	return completed, result
end

local completed, result = test()

if completed then
	if not result then
		error("Tests have failed.", 0)
	end
else
	error(result, 0)
end
