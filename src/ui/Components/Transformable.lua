local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local TransformableTypes = require(script.Parent.Parent.Types.Transformable)
local Immutable = require(script.Parent.Parent.Parent.Immutable)
local e = Roact.createElement

type RoactElement = typeof(Roact.createElement("TextLabel"))
type RoactComponent = typeof(Roact.Component)

--[=[
	A higher order component that allows components the ability to reposition and resize for specifying layout configuration.

	@class Transformable
]=]

--[=[
	The higher order Transformable component.

	To use this higher order component, it must be called with a component. It
	will return a Transformable component wrapped around the former component.

	```lua
		local NewComponent = Transformable(Component)
		local element = Roact.createElement(NewComponent)
	```

	@within Transformable
	@param Component RoactComponent -- The component to wrap within a Transformable
]=]
function Transformable(Component: RoactComponent): RoactComponent
	return function(props: TransformableTypes.Props): RoactElement
		return e("Frame", {
			AnchorPoint = if props.anchorPoint then props.anchorPoint else Vector2.new(0.5, 0.5),
			Position = if props.position then props.position else UDim2.fromScale(0.5, 0.5),
			Size = if props.size then props.size else UDim2.fromScale(1, 1),
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
