local M = {}

return {
  {
    "stevearc/conform.nvim",
    dependecies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      init = function()
        LazyVim.on_very_lazy(function()
          LazyVim.format.register({
            name = "conform.nvim",
            priority = 100,
            primary = true,
            format = function(buf)
              local plugin = require("lazy.core.config").plugins["conform.nvim"]
              local Plugin = require("lazy.core.plugin")
              local opts = Plugin.values(plugin, "opts", false)
              require("conform").format(LazyVim.merge({}, opts.format, { bufnr = buf }))
            end,
            sources = function(buf)
              local ret = require("conform").list_formatters(buf)
              ---@param v conform.FormatterInfo
              return vim.tbl_map(function(v)
                return v.name
              end, ret)
            end,
          })
        end)
      end,

      opts = function()
        local plugin = require("lazy.core.config").plugins["conform.nvim"]
        if plugin.config ~= M.setup then
          LazyVim.error({
            "Do't set `plugin.config` for `conform.nvim`.\n",
            "This will break **LazyVim** formatting.\n",
            "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
          }, { title = "LazyVim" })
        end
        ---@class ConformOpts
        local opts = {
          -- LazyVim will use these options when formatting with the conform.nvim formatter
          format = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsP_fallback = true,
          },
          ---@type table<string, conform.FormatterUnit[]>
          formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            json = { "json" },
            yaml = { "yq" },
            toml = { "toml" },
            markdown = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascriptreact = { "prettier" },
            vue = { "prettier" },
            svelte = { "prettier" },
            graphql = { "prettier" },
            python = { "black" },
            rust = { "rustfmt" },
            go = { "gofmt" },
            java = { "google-java-format" },
            kotlin = { "ktlint" },
            sql = { "sqlformat" },
            php = { "php-cs-fixer" },
            ruby = { "rufo" },
            perl = { "perltidy" },
            c = { "clang-format" },
          },
          -- The options you set here will be merged with the builtin formatters.
          -- You can also define any custom formatters here.
          ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
          formatters = {
            injected = { options = { ignore_errors = true } },
          },
        }
        return opts
      end,
      config = M.setup,
    },
  },
}
