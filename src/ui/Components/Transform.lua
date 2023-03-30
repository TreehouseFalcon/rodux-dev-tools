local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)
local TransformableTypes = require(script.Parent.Parent.Types.Transformable)
local e = Roact.createElement

local function Transform(props: TransformableTypes.Props)
	local color = props.color
	local automaticSize = props.automaticSize

	if props.debug then
		color = Color3.fromHSV(0, 1, 1)
	end

	return e("Frame", {
		AnchorPoint = if props.anchorPoint then props.anchorPoint else Vector2.new(0, 0),
		Position = if props.position then props.position else UDim2.fromScale(0, 0),
		Size = if props.size ~= nil
			then props.size
			elseif automaticSize == Enum.AutomaticSize.X then UDim2.fromScale(0, 1)
			elseif automaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0)
			elseif automaticSize == Enum.AutomaticSize.XY then UDim2.fromScale(0, 0)
			else UDim2.fromScale(1, 1),
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
		[Roact.Change.AbsoluteSize] = props[Roact.Change.AbsoluteSize],
	}, {
		Roact.createFragment(props[Roact.Children]),
	})
end

return Transform
