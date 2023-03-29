local Roact = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local Transform = require(script.Parent.Parent.Transform)
local Transformable = require(script.Parent.Parent.Transformable)
local Icon = require(script.Parent.Parent.Icon)
local Label = require(script.Parent.Parent.Label)

local TIcon = Transformable(Icon)

type Props = {
	icon: string,
	text: string,
	activated: () -> nil,
}

local function ViewTab(props: Props)
	local icon = props.icon
	local text = props.text
	assert(typeof(icon) == "string", "icon must be a string")
	assert(typeof(text) == "string", "text must be a string")

	return e(Transform, {
		size = UDim2.new(0, 140, 1, 0),
	}, {
		Icon = e(TIcon, {
			icon = icon,
			sizeConstraint = Enum.SizeConstraint.RelativeYY,
			size = UDim2.fromOffset(24, 24),
		}),
		Label = e(Label, {
			text = text,
			textSize = 26,
			automaticSize = Enum.AutomaticSize.X,
		}),

		e("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10),
		}),
	})
end

return ViewTab
