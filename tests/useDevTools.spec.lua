local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local RoduxDevTools = require(Packages.RoduxDevTools)
local Rodux = require(Packages.Rodux)
local store = require(Packages.RoduxDevTools.Store)

local function resetLib()
	store:dispatch({
		type = "reset",
	})
	store:flush()
end

return function()
	beforeEach(resetLib)

	it("should only allow one call", function()
		local reducer = function(state)
			return state
		end

		RoduxDevTools.useDevTools(reducer)

		expect(function()
			RoduxDevTools.useDevTools(reducer)
		end).to.throw()
	end)

	it("should not modify passed initialState", function()
		local reducer = function(state)
			return state
		end
		local initialState = {
			testStats = {
				coins = 100,
			},
		}

		local _, resultInitialState = RoduxDevTools.useDevTools(reducer, initialState)

		expect(initialState == resultInitialState).to.equal(true)
		expect(initialState.testStats == resultInitialState.testStats).to.equal(true)
		expect(initialState.testStats.coins == resultInitialState.testStats.coins).to.equal(true)
	end)

	it("should not modify passed errorReporter", function()
		local reducer = function(state)
			return state
		end
		local errorReporter1 = {}
		local errorReporter2 = {
			reportReducerError = function() end,
		}
		local errorReporter3 = {
			reportReducerError = function() end,
			reportUpdateError = function() end,
		}

		local _, _, _, resultErrorReporter1 =
			RoduxDevTools.useDevTools(reducer, nil, nil, errorReporter1)
		resetLib()
		local _, _, _, resultErrorReporter2 =
			RoduxDevTools.useDevTools(reducer, nil, nil, errorReporter2)
		resetLib()
		local _, _, _, resultErrorReporter3 =
			RoduxDevTools.useDevTools(reducer, nil, nil, errorReporter3)

		expect(errorReporter1 == resultErrorReporter1).to.equal(true)
		expect(errorReporter2 == resultErrorReporter2).to.equal(true)
		expect(errorReporter3 == resultErrorReporter3).to.equal(true)
	end)
end
