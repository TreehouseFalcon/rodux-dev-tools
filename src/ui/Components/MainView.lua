local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)

local function MainView(_props) end
MainView = RoactHooks(MainView)

return MainView
