local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local ViewBar = require(script.Parent.ViewBar)
local ThemeContext = require(script.Parent.Parent.Contexts.Theme)

local function MainView(_props, hooks: any)
	local theme = hooks.useContext(ThemeContext)

	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = theme.backgroundColor,
	}, {
		ViewBar = e(ViewBar),
	})
end
MainView = RoactHooks(MainView)

return MainView
