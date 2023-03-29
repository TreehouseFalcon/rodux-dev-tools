local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)
local e = Roact.createElement

export type Props = {
	color: Color3?,
	automaticSize: Enum.AutomaticSize?,
	backgroundTransparency: number?,
	activated: (() -> ())?,
	clicked: ((boolean) -> ())?,
	hovered: ((boolean) -> ())?,
}

local function Button(props: Props)
	local color = if props.color ~= nil then props.color else Color3.fromRGB(18, 134, 229)
	local automaticSize = if props.automaticSize ~= nil
		then props.automaticSize
		else Enum.AutomaticSize.None

	return e("TextButton", {
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.fromScale(0, 0),
		Size = if automaticSize == Enum.AutomaticSize.X
			then UDim2.fromScale(0, 1)
			elseif automaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0)
			elseif automaticSize == Enum.AutomaticSize.XY then UDim2.fromScale(0, 0)
			else UDim2.fromScale(1, 1),
		AutomaticSize = automaticSize,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		BackgroundColor3 = color,
		BackgroundTransparency = props.backgroundTransparency,
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
	}, props[Roact.Children])
end

return Button
