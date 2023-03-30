local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local TransformableTypes = require(script.Parent.Parent.Types.Transformable)
local Immutable = require(script.Parent.Parent.Parent.Immutable)
local e = Roact.createElement

type RoactComponent = typeof(Roact.Component)

local function Transformable(Component: RoactComponent): RoactComponent
	return function(props: TransformableTypes.Props)
		local automaticSize = props.automaticSize

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
			BackgroundTransparency = if props.debug then 0.5 else 1,
			BackgroundColor3 = if props.debug then Color3.new(1, 0, 0) else nil,
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
			TransformableElement = e(
				Component,
				Immutable.merge(Immutable.merge(props, props.innerProps), {
					innerProps = Immutable.Nil,
				})
			),
		})
	end
end

return Transformable
