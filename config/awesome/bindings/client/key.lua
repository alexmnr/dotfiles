local awful = require'awful'

local mod = require'bindings.mod'

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings{
    awful.key{
       modifiers   = {mod.super},
       key         = 'a',
       description = 'toggle fullscreen',
       group       = 'client',
       on_press    = function(c)
          c.fullscreen = not c.fullscreen
          c:raise()
       end,
    },
    awful.key{
       modifiers   = {mod.super},
       key         = 'd',
       description = 'close',
       group       = 'client',
       on_press    = function(c) c:kill() end,
    },
    awful.key{
       modifiers   = {mod.super},
       key         = 'f',
       description = 'toggle floating',
       group       = 'client',
       on_press    = awful.client.floating.toggle,
    },
    awful.key{
       modifiers   = {mod.super, mod.shift},
       key         = 'n',
       description = 'move to screen',
       group       = 'client',
       on_press    = function(c) c:move_to_screen() end,
    },
    awful.key{
       modifiers   = {mod.super},
       key         = 's',
       description = 'minimize',
       group       = 'client',
       on_press    = function(c) c.minimized = true end,
    },
    awful.key{
       modifiers   = {mod.super, mod.shift},
       key         = 's',
       description = '(un)maximize',
       group       = 'client',
       on_press    = function(c)
          c.maximized = not c.maximized
          c:raise()
       end,
    },
  }
end)
