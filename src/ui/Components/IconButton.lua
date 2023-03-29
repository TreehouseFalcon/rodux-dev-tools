local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local Icon = require(script.Parent.Icon)
local e = Roact.createElement

export type Props = {
	icon: string,
	activated: (() -> ())?,
	clicked: ((boolean) -> ())?,
	hovered: ((boolean) -> ())?,
} & Icon.Props

local function IconButton(props: Props)
	assert(props.icon, "Icon is a required prop of IconButton")

	return e("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0,
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Text = "",

		[Roact.Event.Activated] = if props.activated ~= nil
			then function()
				props.activated()
			end
			else nil,

		[Roact.Event.MouseEnter] = if props.hovered
			then function()
				props.hovered(true)
			end
			else nil,

		[Roact.Event.MouseLeave] = if props.hovered
			then function()
				props.hovered(false)
			end
			else nil,

		[Roact.Event.MouseButton1Down] = if props.clicked
			then function()
				props.clicked(true)
			end
			else nil,

		[Roact.Event.MouseButton1Up] = if props.clicked
			then function()
				props.clicked(false)
			end
			else nil,
	}, {
		Icon = e(Icon, {
			icon = props.icon,
			color = props.color,
			transparency = if props.transparency then props.transparency else 0,
		}),
		Roact.createFragment((props :: any)[Roact.Children]),
	})
end

return IconButton
