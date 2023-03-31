local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local Transformable = require(script.Parent.Transformable)
local e = Roact.createElement

type Props = {
	color: Color3?,
}

local function Circle(props: Props)
	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = if props.color then props.color else Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
	}, {
		e("UICorner", {
			CornerRadius = UDim.new(1, 0),
		}),
	})
end
Circle = Transformable(Circle)

return Circle
