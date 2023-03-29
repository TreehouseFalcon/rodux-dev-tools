local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local RoactSpring = require(script.Parent.Parent.Parent.Parent.RoactSpring)
local Transform = require(script.Parent.Transform)
local ViewTab = require(script.ViewTab)
local Immutable = require(script.Parent.Parent.Parent.Immutable)

local TAB_WIDTH = 140
local TABS = {
	{
		icon = "action",
		text = "Actions",
	},
	{
		icon = "settings",
		text = "Settings",
	},
}

type Props = {}

local function ViewBar(_props: Props, hooks: any)
	local selectedTabIndex, setSelectedTabIndex = hooks.useState(1)
	local selectSpring = RoactSpring.useSpring(hooks, {
		index = selectedTabIndex,
		config = {
			frequency = 0.06,
		},
	})

	local viewTabs = {}
	for idx, tab in TABS do
		table.insert(
			viewTabs,
			e(
				ViewTab,
				Immutable.merge(tab, {
					width = TAB_WIDTH,
					layoutOrder = idx,
					activated = function()
						setSelectedTabIndex(idx)
					end,
				})
			)
		)
	end

	return e(Transform, {
		size = UDim2.new(1, 0, 0, 36),
	}, {
		e(Transform, {}, {
			Roact.createFragment(viewTabs),

			e("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 2),
			}),
		}),

		e("Frame", {
			AnchorPoint = Vector2.new(0, 0),
			Position = selectSpring.index:map(function(index)
				return UDim2.new(0, TAB_WIDTH * (index - 1) + 5, 1, 0)
			end),
			Size = UDim2.new(0, TAB_WIDTH - 10, 0, 2),
			BackgroundColor3 = Color3.fromRGB(100, 150, 255),
			BorderSizePixel = 0,
		}),
	})
end
ViewBar = RoactHooks(ViewBar)

return ViewBar
