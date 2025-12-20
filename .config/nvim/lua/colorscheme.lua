local status_ok, github = pcall(require, 'github-theme')
if not status_ok then
  return
end

github.setup({
  comment_style = 'NONE',
	dark_float = false,
	function_style = 'NONE',
	hide_end_of_buffer = true,
	keyword_style = 'NONE',
	msg_area_style = 'NONE',
	sidebars = {'qf', 'vista_kind', 'terminal' ,'packer'},
	transparent = true,
	variable_style = 'NONE'
})

