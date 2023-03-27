set positional-arguments := true

lint +files="src/":
	selene {{files}}
	python scripts/dumpRobloxTypes.py > globalTypes.d.lua
	rojo sourcemap default.project.json > sourcemap.json
	luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.lua --base-luaurc=.luaurc --ignore=**/_Index/** --flag:LuauTypeInferIterationLimit=0 --flag:LuauTarjanChildLimit=0 {{files}}

format +files="src/":
	stylua {{files}}
