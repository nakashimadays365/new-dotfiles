local status, virtual = pcall(require, "nvim-dap-virtual-text")
if not status then
	return
end
virtual.setup({})
