local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)
local Hooks = require(ReplicatedStorage.Packages.RoactHooks).new(Roact)
local Transformable = require(script.Parent.Transformable)
local ThemeContext = require(script.Parent.Parent.Contexts.Theme)
local e = Roact.createElement

export type LabelProps = {
	textColorKey: string?,
	text: string?,
	textStrokeTransparency: number?,
	textSize: number?,
	textWrapped: boolean?,
	textXAlignment: Enum.TextXAlignment?,
	textYAlignment: Enum.TextYAlignment?,
	automaticSize: Enum.AutomaticSize?,
}

local function Label(props: LabelProps, hooks: any)
	local textColorKey = props.textColorKey or "textColor"

	local theme = hooks.useContext(ThemeContext)

	return e("TextLabel", {
		BackgroundTransparency = 1,
		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold),
		AutomaticSize = props.automaticSize,
		Size = UDim2.fromScale(1, 1),
		Text = if props.text then props.text else "",
		TextColor3 = theme[textColorKey],
		TextSize = props.textSize,
		TextWrapped = props.textWrapped,
		TextXAlignment = props.textXAlignment,
		TextYAlignment = props.textYAlignment,
	}, {
		Roact.createFragment(props[Roact.Children]),
	})
end
Label = Transformable(Hooks(Label))

return Label
