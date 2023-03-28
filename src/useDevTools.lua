local store = require(script.Parent.Store)

type Reducer<S> = (state: S, action: any?) -> S
type Middleware = (nextDispatch: () -> (), store: any) -> any
type ErrorReporter<S> = {
	reportReducerError: ((prevState: S, action: any, errorResult: any) -> ())?,
	reportUpdateError: ((prevState: S, currentState: S, actionLog: any, errorResult: any) -> ())?,
}

local function wrapReducer<S>(reducer: Reducer<S>): Reducer<S>
	return function(state: S, action: any)
		return reducer(state, action)
	end
end

return function<S>(
	reducer: Reducer<S>,
	initialState: S?,
	middlewares: { Middleware }?,
	errorReporter: ErrorReporter<S>?
)
	assert(
		store:getState().initialized == false,
		"useDevTools can only be called once. Consider using a single store."
	)

	store:dispatch({
		type = "initialize",
	})

	if typeof(reducer) == "function" then
		local passedReducer = reducer
		reducer = wrapReducer(passedReducer)
	elseif typeof(reducer) == "table" then
		for substateName, substateReducer in reducer do
			assert(
				typeof(substateReducer) == "function",
				"Reducer must be a function or a table of functions"
			)

			local passedSubstateReducer = substateReducer
			reducer[substateName] = wrapReducer(passedSubstateReducer)
		end
	end

	return reducer, initialState, middlewares, errorReporter
end
