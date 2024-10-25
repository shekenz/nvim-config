local list_cmd = io.popen('find ~/.config/nvim/lua/plugins -type f -name "*.lua" -exec basename {} \\;')
local plugins = {}

-- Use blacklist to isolate problems with plugins
local use_blacklist = false
local blacklist = {'luasnip'}

local function has_value (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

for line in list_cmd:lines() do
  if line ~= 'init.lua' then
    local plugin_name = string.gsub(line, '.lua', '')
    local plugin_conf = require('plugins.' .. plugin_name)
    if plugin_conf then
      if not use_blacklist or not has_value(blacklist, plugin_name) then
        table.insert(plugins, plugin_conf)
      end
    end
  end
end

return plugins
