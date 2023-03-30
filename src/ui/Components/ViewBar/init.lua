local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local RoactSpring = require(script.Parent.Parent.Parent.Parent.RoactSpring)
local Transform = require(script.Parent.Transform)
local ViewTab = require(script.ViewTab)
local Immutable = require(script.Parent.Parent.Parent.Immutable)
local ScreenContext = require(script.Parent.Parent.Contexts.Screen)
local Underline = require(script.Underline)

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
local TAB_WIDTH_PIXELS = 140
local TAB_WIDTH_PERCENT = 1 / #TABS

type Props = {}

local function ViewBar(_props: Props, hooks: any)
	local selectedTabIndex, setSelectedTabIndex = hooks.useState(1)
	local screenContext = hooks.useContext(ScreenContext)
	local selectSpring = RoactSpring.useSpring(hooks, {
		index = selectedTabIndex,
		config = {
			frequency = 0.06,
		},
	})

	local screenSpaceMode = screenContext.screenSpaceMode
	local tabWidth = if screenSpaceMode == "Mobile"
		then UDim.new(TAB_WIDTH_PERCENT, 0)
		else UDim.new(0, TAB_WIDTH_PIXELS)

	local viewTabs = {}
	for idx, tab in TABS do
		table.insert(
			viewTabs,
			e(
				ViewTab,
				Immutable.merge(tab, {
					width = tabWidth,
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

		e(Underline, {
			position = selectSpring.index:map(function(index)
				if screenSpaceMode == "Mobile" then
					return UDim2.new(TAB_WIDTH_PERCENT * (index - 1), 0, 0, 0)
				else
					return UDim2.new(0, TAB_WIDTH_PIXELS * (index - 1), 0, 0)
				end
			end),
			size = tabWidth,
			underlineWidthPixels = TAB_WIDTH_PIXELS,
		}),
	})
end
ViewBar = RoactHooks(ViewBar)

return ViewBar
