local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)
local Icons = require(script.Icons)
local e = Roact.createElement

export type Props = {
	icon: string,
	color: Color3?,
	transparency: number?,
}

local function Icon(props: Props)
	local icon = Icons[props.icon]
	assert(icon, tostring(icon) .. " is not a valid icon name or size")

	return e("ImageLabel", {
		Size = UDim2.fromScale(1, 1),
		ZIndex = 2,
		Image = icon,
		ImageColor3 = props.color,
		ImageTransparency = if props.transparency then props.transparency else 0,
		BackgroundTransparency = 1,
	}, {
		Roact.createFragment(props[Roact.Children]),
	})
end

return Icon
