set positional-arguments := true

lint +files="src/":
	selene {{files}}
	python scripts/dumpRobloxTypes.py > globalTypes.d.lua
	rojo sourcemap default.project.json > sourcemap.json
	luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.lua --base-luaurc=.luaurc --ignore=**/_Index/** --flag:LuauTypeInferIterationLimit=0 --flag:LuauTarjanChildLimit=0 {{files}}

format +files="src/":
	stylua {{files}}

husky-init-only-run-once:
	npx husky-init
	sed -i '$ d' .husky/pre-commit # Remove the last line in the precommit script (should be "npm test" at the time of writing)
	echo "exec >/dev/tty 2>&1;" >> .husky/pre-commit
	echo "npx lint-staged" >> .husky/pre-commit # Replace with lint-staged invocation
