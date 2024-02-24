local status, dap = pcall(require, "dap")
if not status then
	return
end
dap.configurations.go = {
	{
		type = "excutable",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		goPath = function()
			return "/opt/homebrew/bin/go"
		end,
	},
}

dap.adapters.go = {
	type = { "go", "gomod", "gowork", "gotmpl" },
	command = { "gopls" },
	single_file_support = true,
}
