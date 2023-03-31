local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local Button = require(script.Parent.Button)
local Transformable = require(script.Parent.Transformable)
local ThemeContext = require(script.Parent.Parent.Contexts.Theme)

local TButton = Transformable(Button)

type Props = {
	icon: string,
	color: Color3?,
	activated: () -> (),
}

local function ActionBarItem(props: Props, hooks: any)
	local theme = hooks.useContext(ThemeContext)

	return e(TButton, {
		sizeConstraint = Enum.SizeConstraint.RelativeYY,
		size = UDim2.fromScale(1, 1),
		backgroundTransparency = 0.8,
		color = props.color or theme.foregroundColor,
	}, props[Roact.Children])
end
ActionBarItem = RoactHooks(ActionBarItem)

return ActionBarItem
