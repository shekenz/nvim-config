local list_cmd = io.popen('find ~/.config/nvim/lua/plugins -type f -name "*.lua" -exec basename {} \\;')
local plugins = {}

for line in list_cmd:lines() do
  if line ~= 'init.lua' then
    local plugin_name = string.gsub(line, '.lua', '')
    local plugin_conf = require('plugins.' .. plugin_name)
    if plugin_conf then
      table.insert(plugins, plugin_conf)
    end
  end
end

return plugins
