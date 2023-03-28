local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Packages = ReplicatedStorage.Packages
local RoduxDevTools = require(Packages.RoduxDevTools)
local store = require(Packages.RoduxDevTools.Store)

local function resetLib()
	store:dispatch({
		type = "reset",
	})
	store:flush()
end

return function()
	beforeEach(resetLib)

	it("should toggle the visibility of the window", function()
		expect(RoduxDevTools.setWindowVisibility(true, ServerStorage)).to.equal(true)
		expect(RoduxDevTools.setWindowVisibility(false)).to.equal(true)
	end)
end
