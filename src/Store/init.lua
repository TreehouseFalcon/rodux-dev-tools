local Rodux = require(script.Parent.Parent.Rodux)
local Immutable = require(script.Parent.Immutable)

local initialState = {
	initialized = false,
}

return Rodux.Store.new(function(state, action)
	if action.type == "initialize" then
		return Immutable.merge(state, {
			initialized = true,
		})
	elseif action.type == "reset" then
		return initialState
	end

	return state
end)
