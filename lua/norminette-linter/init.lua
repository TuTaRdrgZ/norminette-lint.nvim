local M = {}

local group = vim.api.nvim_create_augroup("Norminette", { clear = true })

vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost"}, {
  pattern = "*.c",
  group = group,
  callback = function(event)
    local ns = vim.api.nvim_create_namespace("norminette")
    vim.api.nvim_buf_clear_namespace(event.buf, ns, 0, -1)

    local output = vim.fn.system("norminette " .. vim.api.nvim_buf_get_name(event.buf))
    local lines = vim.split(output, "\n")

    for _, line in ipairs(lines) do
      local parts = vim.split(line, ":")
      -- print(vim.inspect(parts))
      if #parts < 3 then
        goto continue
      end

      parts[3] = string.match(parts[3], '%d[%d]')
      -- print(parts[3])

      local row = tonumber(parts[3])
      local col = tonumber(parts[4])
      local message = parts[5]

      vim.api.nvim_buf_set_virtual_text(event.buf, ns, row - 1, {{message, "IncSearch"}}, {})
      ::continue::
    end
  end
})

return M
