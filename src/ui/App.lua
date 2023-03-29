local Roact = require(script.Parent.Parent.Parent.Roact)
-- selene: allow(unused_variable)
local Rodux = require(script.Parent.Parent.Parent.Rodux)
local RoduxHooks = require(script.Parent.Parent.Parent.RoduxHooks)
local MainView = require(script.Parent.Components.MainView)
local ThemeContext = require(script.Parent.Contexts.Theme)
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
		e(ThemeContext.Provider, {
			value = {
				backgroundColor = Color3.fromHex("#2e303e"),
				textColor = Color3.fromRGB(255, 255, 255),
			},
		}, {
			RoduxDevTools = if wrapInScreenGui
				then e("ScreenGui", {
					ResetOnSpawn = false,
					DisplayOrder = 1000000000,
				}, {
					MainView = e(MainView),
				})
				else e(MainView),
		}),
	})
end

return App
