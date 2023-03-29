local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local Label = require(script.Parent.Label)
local e = Roact.createElement

local function MainView(_props)
	return e(Label, {
		text = "Hello, world!",
	})
end
MainView = RoactHooks(MainView)

return MainView
