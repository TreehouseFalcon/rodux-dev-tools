local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoduxDevTools = require(ReplicatedStorage.RoduxDevTools)

return function()
	describe("Main module (init)", function()
		it("should export a table", function()
			expect(RoduxDevTools).to.be.a("table")
		end)
		it("should export useDevTools properly", function()
			expect(RoduxDevTools.useDevTools).to.be.a("function")
		end)
	end)
end
