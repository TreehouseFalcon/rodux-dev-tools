local Roact = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local Transform = require(script.Parent.Parent.Transform)

type Props = {
	position: UDim,
	size: UDim,
	underlineWidthPixels: number,
}

local function Underline(props: Props)
	local position = props.position
	local size = props.size
	local underlineWidthPixels = props.underlineWidthPixels

	return e(Transform, {
		size = UDim2.new(size, UDim.new(1, 0)),
		position = position,
	}, {
		e("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 1),
			Size = UDim2.new(0, underlineWidthPixels - 10, 0, 2),
			BackgroundColor3 = Color3.fromRGB(100, 150, 255),
			BorderSizePixel = 0,
		}),
	})
end

return Underline
