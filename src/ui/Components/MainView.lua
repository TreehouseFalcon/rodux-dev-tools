local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local e = Roact.createElement

local function MainView(_props, hooks: any)
	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
	})
end
MainView = RoactHooks(MainView)

return MainView
