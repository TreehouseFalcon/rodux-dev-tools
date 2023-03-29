local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local Transform = require(script.Parent.Transform)
local ViewTab = require(script.ViewTab)
local Immutable = require(script.Parent.Parent.Parent.Immutable)

local TABS = {
	{
		icon = "action",
		text = "Actions",
		activated = function()
			print("Action view time")
		end,
	},
	{
		icon = "settings",
		text = "Settings",
		activated = function()
			print("Settings view time")
		end,
	},
}

local function ViewBar()
	local viewTabs = {}
	for i, tab in TABS do
		table.insert(
			viewTabs,
			e(
				ViewTab,
				Immutable.merge(tab, {
					layoutOrder = i,
				})
			)
		)
	end

	return e(Transform, {
		size = UDim2.new(1, 0, 0, 32),
	}, {
		Roact.createFragment(viewTabs),

		e("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0),
		}),
	})
end

return ViewBar
