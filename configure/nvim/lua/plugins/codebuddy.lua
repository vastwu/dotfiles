-- 配置 codecompanion.nvim（适配自定义 CodeBuddy ACP Agent）
return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      language = "Chinese",
      strategies = {
        chat = {
          adapter = "codebuddy"  -- 使用 codebuddy 作为默认适配器
        },
        inline = {
          adapter = "codebuddy",
        }
      },
      adapters = {
        acp = {
          codebuddy = function()
            return require("codecompanion.adapters").extend("opencode", {
              formatted_name = 'Codebuddy Code CLI',
              commands = {
                default = { 'codebuddy', '--acp', '--model', 'Claude-Sonnet-4.6' },
                gemini = { 'codebuddy', '--acp', '--model', 'gemini-3.0-pro' },
              },
              defaults = {
                timeout = 20000, -- 20 seconds
              },
            })
          end,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lualine/lualine.nvim"
    },
  },
}
