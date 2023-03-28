--[=[
	The props for the component.

	.position? UDim2 -- The position the Transformable should go to relative to its parent
	.size? UDim2 -- The size the Transformable should be relative to its parent
	.anchorPoint? Vector2 -- The anchor point position relative to the Transformable's size
	.rotation? number -- The rotation of the Transformable in degrees
	.sizeConstraint? Enum.SizeConstraint -- The Transformable's size constraint relative to its parent
	.automaticSize? Enum.AutomaticSize -- The axis on which to automatically size the Transformable
	.visible? boolean -- Whether or not the Transformable is visible
	.layoutOrder? number -- The layoutOrder number of the Frame
	.zIndex? number -- The order in which siblings are rendered
	.clipsDescendants? boolean -- Whether descendants will be clipped if outside this Transformable
	.innerProps? any -- Props to pass through to the inner component
	.debug? boolean -- Draws the bounding box of the Transformable if true

	@within Transformable
	@interface Props
]=]

--[=[
	The props for the component.

	.position? UDim2 -- The position the Transform should go to relative to its parent
	.size? UDim2 -- The size the Transform should be relative to its parent
	.anchorPoint? Vector2 -- The anchor point position relative to the Transform's size
	.rotation? number -- The rotation of the Transform in degrees
	.sizeConstraint? Enum.SizeConstraint -- The Transform's size constraint relative to its parent
	.automaticSize? Enum.AutomaticSize -- The axis on which to automatically size the Transform
	.visible? boolean -- Whether or not the Transform is visible
	.layoutOrder? number -- The layoutOrder number of the Transform
	.zIndex? number -- The order in which siblings are rendered
	.clipsDescendants? boolean -- Whether descendants will be clipped if outside this Transform
	.debug? boolean -- Draws the bounding box of the Transform if true

	@within Transform
	@interface Props
]=]

export type Props = {
	position: UDim2?,
	size: UDim2?,
	anchorPoint: Vector2?,
	rotation: number?,
	layoutOrder: number?,
	sizeConstraint: Enum.SizeConstraint?,
	automaticSize: Enum.AutomaticSize?,
	visible: boolean?,
	zIndex: number?,
	clipsDescendants: boolean?,
	color: Color3?,
	innerProps: any?,
	debug: boolean?,
}

return nil
