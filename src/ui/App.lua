local Roact = require(script.Parent.Parent.Parent.Roact)
-- selene: allow(unused_variable)
local Rodux = require(script.Parent.Parent.Parent.Rodux)
local RoduxHooks = require(script.Parent.Parent.Parent.RoduxHooks)
local MainView = require(script.Parent.Components.MainView)
local e = Roact.createElement

type AppProps = {
	roduxStore: typeof(Rodux.Store),
	wrapInScreenGui: boolean?,
}

local function App(props: AppProps)
	local store = props.roduxStore
	local wrapInScreenGui = props.wrapInScreenGui

	return e(RoduxHooks.Provider, {
		store = store,
	}, {
		RoduxDevTools = if wrapInScreenGui
			then e("ScreenGui", {
				ResetOnSpawn = false,
				DisplayOrder = 1000000000,
			}, {
				MainView = e(MainView),
			})
			else e(MainView),
	})
end

return App
