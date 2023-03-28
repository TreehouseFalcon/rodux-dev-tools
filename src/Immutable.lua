local Symbol = require(script.Parent.Symbol)

--[=[
	Contains useful tools for working with immutable tables.

	These never mutate the original data. Instead, they perform a shallow copy of
	the modified data to return.

	@class Immutable
]=]
local Immutable = {}
local NIL_SYMBOL = Symbol.create("Immutable.Nil")
Immutable.Nil = NIL_SYMBOL

--[=[
	Merges all entries from any number of original data tables.
	Using a value of `Immutable.Nil` in a partial table will remove the corresponding key from the resulting table.

	```lua
		local merged = Immutable.merge(data, {
			height = 10,
			width = 20,
			deleteMe = Immutable.Nil,
		})
	```

	@param ... { [K]: V } -- The original data
	@return { [K]: V } -- A merged copy of the data
]=]
function Immutable.merge<T>(base: T, ...: {} | T)
	local merged = {}
	for _, original in { base, ... } do
		for key, value in original do
			merged[key] = if value == NIL_SYMBOL then nil else value
		end
	end
	return merged
end

--[=[
	Compares all entries from any number of original data tables for shallow
	equality.

	```lua
		local equal = Immutable.equal(data, {
			height = 10,
			width = 20,
		})
	```

	This is an O(nm²) operation. Be careful when using large data sets.

	@param ... { [K]: V } -- The original data
	@return boolean -- True if all entries are equal, false otherwise
]=]
function Immutable.equal(...)
	for _, left in { ... } do
		for _, right in { ... } do
			if left == right then
				-- This is the same table, we short circuit
				continue
			end
			for key, value in left do
				if value == right[key] then
					continue
				end
				return false
			end
		end
	end
	return true
end

return Immutable
