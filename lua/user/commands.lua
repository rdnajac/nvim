--- lua/user/commands.lua
local cmd = vim.api.nvim_create_user_command

cmd('Explore', 'Oil <args>', { nargs = '?', complete = 'dir' })
cmd('E', 'Explore <args>', { nargs = '?', complete = 'dir' })
cmd('Sexplore', 'belowright split | Oil <args>', { nargs = '?', complete = 'dir' })
cmd('Vexplore', 'rightbelow vsplit | Oil <args>', { nargs = '?', complete = 'dir' })
cmd('Texplore', 'tabedit % | Oil <args>', { nargs = '?', complete = 'dir' })
