local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)
local TransformableTypes = require(script.Parent.Parent.Types.Transformable)

type RoactElement = typeof(Roact.createElement("TextLabel"))

--[=[
	An instantiable component used for specifying layout configuration. Based on Transformable.

	@class Transform
]=]

--[=[
	The Transform component.

	This code creates a Transform that sits at the center-bottom of the parent component:

	```lua
		local transform = Roact.createElement(Transform, {
			anchorPoint = Vector2.new(0.5, 1),
			size = UDim2.fromScale(0.75, 0.25),
			position = UDim2.fromScale(0.5, 1)
		})
	```

	@within Transform
]=]
local function Transform(props: TransformableTypes.Props): RoactElement
	local color = props.color
	if props.debug then
		color = Color3.fromHSV(0, 1, 1)
	end

	return Roact.createElement("Frame", {
		AnchorPoint = if props.anchorPoint then props.anchorPoint else Vector2.new(0.5, 0.5),
		Position = if props.position then props.position else UDim2.fromScale(0.5, 0.5),
		Size = if props.size then props.size else UDim2.fromScale(1, 1),
		AutomaticSize = props.automaticSize,
		Rotation = props.rotation,
		BackgroundTransparency = if color then 0.5 else 1,
		BackgroundColor3 = if color then color else nil,
		BorderSizePixel = 0,
		Visible = props.visible,
		LayoutOrder = if props.layoutOrder then props.layoutOrder else 0,
		ZIndex = if props.zIndex then props.zIndex else 1,
		ClipsDescendants = props.clipsDescendants,
		SizeConstraint = if props.sizeConstraint
			then props.sizeConstraint
			else Enum.SizeConstraint.RelativeXY,

		[Roact.Event.InputEnded] = props[Roact.Event.InputEnded],
		[Roact.Event.MouseMoved] = props[Roact.Event.MouseMoved],
		[Roact.Event.MouseLeave] = props[Roact.Event.MouseLeave],
	}, {
		Roact.createFragment(props[Roact.Children]),
	})
end

return Transform
