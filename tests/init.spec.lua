local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local RoduxDevTools = require(ReplicatedStorage.Packages.RoduxDevTools)
local store = require(Packages.RoduxDevTools.Store)

local function resetLib()
	store:dispatch({
		type = "reset",
	})
	store:flush()
end

return function()
	describe("Main module (init)", function()
		beforeEach(resetLib)

		it("should export a table", function()
			expect(RoduxDevTools).to.be.a("table")
		end)
		it("should export useDevTools properly", function()
			expect(RoduxDevTools.useDevTools).to.be.a("function")
		end)
	end)
end
