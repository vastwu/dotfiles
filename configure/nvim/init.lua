-- ================ Lazy.nvim 初始化（必须放在配置最顶部） ================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- 自动安装 Lazy.nvim（如果没装的话，可替代手动克隆命令）
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- 用最新稳定版
		lazypath,
	})
end
-- 将 Lazy.nvim 添加到 Neovim 的运行时路径
vim.opt.rtp:prepend(lazypath)

-- 语言和编码设置
vim.env.LANG = 'en'
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,gbk'
-- vim.opt.termencoding = 'utf-8'

-- 基础配置
vim.opt.modelines = 0  -- CVE-2007-2438
vim.opt.termguicolors = true  -- 替代 t_Co=256
vim.opt.number = true
vim.opt.relativenumber = true  -- rnu
vim.opt.laststatus = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.showtabline = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.ai = true
vim.opt.hlsearch = true
vim.opt.history = 400
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.backspace = '2'
vim.opt.compatible = false
vim.opt.cmdheight = 4
-- 系统内置剪切板
vim.opt.clipboard = 'unnamedplus'

-- 格式化选项
vim.opt.formatoptions = 'tcpmM'

-- 粘贴模式切换
-- vim.opt.pastetoggle = '<F9>'

-- 更新时间 (用于 CursorHold 等事件)
vim.opt.updatetime = 1000

-- 文件类型检测
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.cmd('syntax on')

-- Leader 键设置
vim.g.mapleader = ','

require("lazy").setup({
  require("plugins.codebuddy"),
	{
		"neoclide/coc.nvim",
		branch = "release",
    build = 'yarn install --frozen-lockfile'
	},
  {
    'scrooloose/nerdtree',
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeIgnore = {'.git$', '.DS_Store', '.swo', '.vscode', '__pycache__'}
      vim.g.NERDTreeWinSize = 50
    end
  },
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' }
  },
	'vim-airline/vim-airline-themes',
	'https://github.com/tpope/vim-surround',
	-- 主题色
	{
 		'tomasr/molokai',
		lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme molokai')
			-- 透明背景
			-- Popup Menu 颜色
			vim.cmd('hi Pmenu ctermfg=white ctermbg=017')

      -- 修复折叠行的配色
      -- vim.api.nvim_set_hl(0, "Folded", { fg = "#888888", bg = "#2a2a2a" })
      -- 修复光标行的配色
      -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#333333" })
      -- 修复注释的配色（更柔和）
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#75715e", italic = true })

			-- 定义 Coc 悬浮提示的高亮组（优先级最高）
			vim.api.nvim_set_hl(0, "CocHoverFloat", {
					fg = "#f8f8f2",    -- 前景色（Molokai 浅色文字）
					bg = "#272822",    -- 背景色（Molokai 深色背景）
					ctermfg = 15,      -- 终端 256 色适配
					ctermbg = 234
			})
			-- 定义悬浮窗口边框高亮
			vim.api.nvim_set_hl(0, "CocHoverBorder", {
					fg = "#66d9ef",    -- 边框色（Molokai 蓝色）
					bg = "#272822",
					ctermfg = 81,
					ctermbg = 234
			})
			-- ========== 标签页（Tab）配色优化 ==========
			vim.api.nvim_set_hl(0, "TabLine", {
					fg = "#888888",       -- 未选中标签文字色（浅灰）
					bg = "#2a2a2a",       -- 未选中标签背景色（深灰）
					italic = false        -- 取消斜体，增强可读性
			})
			vim.api.nvim_set_hl(0, "TabLineSel", {
					fg = "#66d9ef",       -- 选中标签文字色（Molokai 主色）
					bg = "#44475a",       -- 选中标签背景色（偏蓝的深灰，突出选中状态）
					bold = true,          -- 加粗文字，强化对比
			})
			vim.api.nvim_set_hl(0, "TabLineFill", {
					bg = "#1e1e1e",       -- 标签栏空白区背景（比编辑区稍深）
			})
			vim.opt.showtabline = 2  -- 始终显示标签栏（0=不显示，1=多标签时显示，2=始终显示）

			-- 禁用 Coc 内置的悬浮窗口样式自动适配（避免冲突）
			vim.g.coc_disable_float_highlight = 0
			-- 设置悬浮窗口最大宽度（避免占满屏幕）
			vim.g.coc_hover_max_width = 80
    end
	},
  -- 模糊查找
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
  },
  'junegunn/fzf.vim',

  -- TypeScript 支持
	'leafgarland/typescript-vim',
	'peitalin/vim-jsx-typescript',
	'isRuslan/vim-es6',

  -- Markdown 支持
	'godlygeek/tabular',
	'plasticboy/vim-markdown',
  -- 标签栏
  'preservim/tagbar',
  -- Git 集成
	'tpope/vim-fugitive',
  -- 代码检查
	'w0rp/ale',
})


-- ALE 配置
vim.g.ale_sign_column_always = 1
vim.g.ale_set_highlights = 0
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_enter = 0
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '⚡'
vim.g.ale_statusline_format = {'✗ %d', '⚡ %d', '✔ OK'}
vim.g['airline#extensions#ale#enabled'] = 1
vim.g.ale_linters = {
  javascript = {'eslint', 'tsserver'},
  typescript = {'eslint', 'tsserver', 'typecheck'},
  typescriptreact = {'eslint', 'tsserver', 'typecheck'},
}

-- Airline 配置
vim.g.Airline_theme = 'solarized'
vim.g.airline_solarized_bg = 'dark'

-- FZF 配置
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
vim.g.fzf_layout = { down = '60%' }
vim.g.fzf_history_dir = '~/.local/share/fzf-history'

-- Notational FZF 配置
vim.g.nv_search_paths = {'./'}
vim.g.nv_ignore_pattern = {'yarn.lock', 'yarn-error.log', 'node_modules', 'docs', 'dist'}
vim.g.nv_use_short_pathnames = 0

-- Tagbar 配置
vim.g.tagbar_show_data_type = 1
vim.g.tagbar_type_typescript = {
  kinds = {
    'n:namespaces',
    'i:interfaces',
    'g:enums',
    'e:enumerations',
    'c:classes',
    'f:functions',
    'p:properties',
    'm:methods',
    '?:unknown',
  }
}

-- Vim-markdown 配置
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_folding_disabled = 1

-- COC.nvim 配置
vim.g.coc_global_extensions = {'coc-tsserver'}

-- Copilot 配置
vim.g.copilot_no_tab_map = 1

-- ============================================================================
-- 键位映射
-- ============================================================================

-- 标签页切换
vim.keymap.set('n', '<C-l>', 'gt', { noremap = true })
vim.keymap.set('n', '<C-h>', 'gT', { noremap = true })

-- 剪贴板操作 (macOS pbcopy/pbpaste)
vim.keymap.set('v', '"+y', ':w !pbcopy<CR><CR>', { noremap = true })
vim.keymap.set('n', '"+p', ':r !pbpaste<CR><CR>', { noremap = true })

-- 快捷命令
vim.keymap.set('n', '<F5>', ':call OpenFile()<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<F5>', ':CarbonNowSh<CR>', { noremap = true })

-- NERDTree
vim.keymap.set('n', '<F2>', ':NERDTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>f', ':NERDTreeFind<CR>', { noremap = true })

-- Tagbar
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>t', ':TagbarToggle<CR>', { noremap = true })

-- FZF
vim.keymap.set('n', '<C-p>', ':Files<CR>', { noremap = true })
vim.keymap.set('n', '<F3>', ':NV<space>', { noremap = true })

-- Git Blame
vim.keymap.set('c', 'gb', 'Git blame<CR>', { noremap = true })

-- COC.nvim 键位映射
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', 'do', '<Plug>(coc-codeaction)', { silent = true })
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

-- ALE 导航
vim.keymap.set('n', 'sp', '<Plug>(ale_previous_wrap)', { noremap = true })
vim.keymap.set('n', 'sn', '<Plug>(ale_next_wrap)', { noremap = true })
vim.keymap.set('n', '<Leader>d', ':ALEDetail<CR>', { noremap = true })

-- COC 补全和提示
vim.keymap.set('i', '<C-l>', 'copilot#Accept()', { script = true, silent = true, nowait = true, expr = true })
vim.keymap.set('i', '<S-C-C>', '<Plug>(copilot-suggest)', {})

-- K 显示文档
vim.keymap.set('n', 'K', '<cmd>lua show_documentation()<CR>', { noremap = true, silent = true })


-- 显示文档函数
function _G.show_documentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end

-- ALE Linter 状态函数
function _G.LinterStatus()
  local counts = vim.fn['ale#statusline#Count'](vim.fn.bufnr(''))
  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors
  
  if counts.total == 0 then
    return 'OK'
  else
    return string.format('%dW %dE', all_non_errors, all_errors)
  end
end

-- 保存时移除 ^M
vim.api.nvim_create_autocmd('BufWrite', {
  group = augroup,
  pattern = {'*.js', '*.jsx', '*.ts', '*.tsx'},
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[silent! %s/\r$//ge]])
    vim.fn.setpos('.', save_cursor)
  end
})

-- 小程序文件类型设置
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = augroup,
  pattern = '*.wxss',
  command = 'setfiletype css'
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = augroup,
  pattern = '*.wxml',
  command = 'setfiletype html'
})

-- TypeScript React 文件类型
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = '*',
  command = 'setlocal tabstop=2 shiftwidth=2 expandtab'
})

-- COC CursorHold 高亮
vim.api.nvim_create_autocmd('CursorHold', {
  group = augroup,
  pattern = '*',
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
  desc = 'Highlight symbol under cursor'
})
