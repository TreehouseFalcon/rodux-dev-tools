return function(...)
	local args = { ... }
	local reducer = args[1]
	local initialState = args[2]
	local middlewares = args[3]
	local errorReporter = args[4]

	if typeof(reducer) == "function" then
		local passedReducer = reducer
		reducer = function(...)
			return passedReducer(...)
		end
	end

	return reducer, initialState, middlewares, errorReporter
end
