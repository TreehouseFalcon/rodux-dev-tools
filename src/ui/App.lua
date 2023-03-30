local Roact = require(script.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.RoactHooks).new(Roact)
-- selene: allow(unused_variable)
local Rodux = require(script.Parent.Parent.Parent.Rodux)
local RoduxHooks = require(script.Parent.Parent.Parent.RoduxHooks)
local MainView = require(script.Parent.Components.MainView)
local ScreenContext = require(script.Parent.Contexts.Screen)
local Transform = require(script.Parent.Components.Transform)

type AppProps = {
	roduxStore: typeof(Rodux.Store),
	wrapInScreenGui: boolean?,
}

local function App(props: AppProps, hooks: any)
	local store = props.roduxStore
	local wrapInScreenGui = props.wrapInScreenGui

	local screenSize, setScreenSize = hooks.useState(Vector2.new(0, 0))

	local screenSpaceMode = if screenSize.X < 600 then "Mobile" else "Desktop"

	return e(RoduxHooks.Provider, {
		store = store,
	}, {
		e(ScreenContext.Provider, {
			value = {
				screenSpaceMode = screenSpaceMode,
			},
		}, {
			RoduxDevTools = if wrapInScreenGui
				then e("ScreenGui", {
					ResetOnSpawn = false,
					DisplayOrder = 1000000000,

					[Roact.Change.AbsoluteSize] = function(obj)
						print(obj.AbsoluteSize)
						setScreenSize(obj.AbsoluteSize)
					end,
				}, {
					MainView = e(MainView),
				})
				else e(Transform, {
					[Roact.Change.AbsoluteSize] = function(obj)
						setScreenSize(obj.AbsoluteSize)
					end,
				}, {
					MainView = e(MainView),
				}),
		}),
	})
end
App = RoactHooks(App)

return App
