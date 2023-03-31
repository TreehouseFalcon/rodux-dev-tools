local Roact = require(script.Parent.Parent.Parent.Parent.Roact)
local e = Roact.createElement
local RoactHooks = require(script.Parent.Parent.Parent.Parent.RoactHooks).new(Roact)
local ViewBar = require(script.Parent.ViewBar)
local ThemeContext = require(script.Parent.Parent.Contexts.Theme)
local Transform = require(script.Parent.Transform)
local ActionBarItem = require(script.Parent.ActionBarItem)
local Circle = require(script.Parent.Circle)

local function MainView(_props, hooks: any)
	local theme = hooks.useContext(ThemeContext)

	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = theme.backgroundColor,
	}, {
		ViewBar = e(ViewBar),

		Content = e(Transform, {
			size = UDim2.new(1, -20, 1, 0),
			position = UDim2.fromScale(0.5, 0),
			anchorPoint = Vector2.new(0.5, 0),
			layoutOrder = 2,
		}, {
			ActionBar = e(Transform, {
				size = UDim2.new(1, 0, 0, 36),
				layoutOrder = 1,
			}, {
				Record = e(ActionBarItem, {
					color = Color3.fromHex("fb9fb1"),
				}, {
					e(Circle, {
						anchorPoint = Vector2.new(0.5, 0.5),
						position = UDim2.fromScale(0.5, 0.5),
						size = UDim2.fromScale(0.5, 0.5),
						color = Color3.fromHex("fb9fb1"),
					}),
				}),

				e("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5),
				}),
			}),

			DataViews = e(Transform, {
				size = UDim2.new(1, 0, 1, -96),
				layoutOrder = 2,
			}, {
				ActionsList = e("Frame", {
					Size = UDim2.new(1, 0, 0.5, -10),
					BackgroundColor3 = theme.foregroundColor,
					BorderColor3 = Color3.new(0, 0, 0),
					LayoutOrder = 1,
				}),
				DataPane = e("Frame", {
					Size = UDim2.new(1, 0, 0.5, -10),
					BackgroundColor3 = theme.foregroundColor,
					BorderColor3 = Color3.new(0, 0, 0),
					LayoutOrder = 2,
				}),
				e("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20),
				}),
			}),

			e("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8),
			}),
		}),

		e("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 8),
		}),
	})
end
MainView = RoactHooks(MainView)

return MainView
