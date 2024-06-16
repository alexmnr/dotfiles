local awful = require'awful'
require'awful.hotkeys_popup.keys'
local menubar = require'menubar'

local apps = require'config.apps'
local mod = require'bindings.mod'

menubar.utils.terminal = apps.terminal

-- general awesome keys
awful.keyboard.append_global_keybindings{
  --------------- Default Programs
  awful.key{
    modifiers   = {mod.ctrl, mod.alt},
    key         = 't',
    description = 'open terminal',
    group       = 'launcher',
    on_press    = function()
      awful.spawn(apps.terminal)
    end,
  },
  awful.key{
    modifiers   = {mod.ctrl, mod.alt},
    key         = 'b',
    description = 'open browser',
    group       = 'launcher',
    on_press    = function()
      awful.spawn(apps.browser)
    end,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'e',
    description = 'show the menubar',
    group       = 'launcher',
    on_press    = function()
      awful.spawn("/home/senaex/.config/rofi/launcher.sh")
    end,

  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'r',
    description = 'show the menubar',
    group       = 'launcher',
    on_press    = function()
      awful.spawn("rofi -show run -show-icons")
    end,
  },
  awful.key{
    modifiers   = {mod.alt},
    key         = 'Tab',
    description = 'Window Switcher',
    group       = 'bling',
    on_press    = function()
      awesome.emit_signal("bling::window_switcher::turn_on")
    end,

  },
  --------------- Focus Windows
  awful.key{
    modifiers   = {mod.super},
    key         = 'j',
    description = 'focus window down',
    group       = 'awesome',
    on_press    = function()
      awful.client.focus.bydirection("down")
      if client.focus then client.focus:raise() end
    end,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'k',
    description = 'focus window up',
    group       = 'awesome',
    on_press    = function()
      awful.client.focus.bydirection("up")
      if client.focus then client.focus:raise() end
    end,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'h',
    description = 'focus window left',
    group       = 'layout',
    on_press    = function()
      awful.client.focus.bydirection("left")
      if client.focus then client.focus:raise() end
    end,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'l',
    description = 'focus window right',
    group       = 'layout',
    on_press    = function()
      awful.client.focus.bydirection("right")
      if client.focus then client.focus:raise() end
    end,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'Tab',
    description = 'go back',
    group       = 'client',
    on_press    = function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
  },
  --------------- Rezize Windows
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'l',
    description = 'increase window size to the right',
    group       = 'layout',
    on_press    = function()
      awful.tag.incmwfact(0.05)
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'h',
    description = 'increase window size to the left',
    group       = 'layout',
    on_press    = function()
      awful.tag.incmwfact(-0.05)
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'k',
    description = 'increase window size to the top',
    group       = 'layout',
    on_press    = function()
      awful.client.incwfact(-0.10)
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'j',
    description = 'increase window size to the bottom',
    group       = 'layout',
    on_press    = function()
      awful.client.incwfact(0.10)
    end,
  },

  --------------- Move Windows
  awful.key{
    modifiers   = {mod.super, mod.ctrl},
    key         = 'l',
    description = 'swap with right windwow',
    group       = 'layout',
    on_press    = function()
      awful.client.swap.bydirection("right")
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.ctrl},
    key         = 'h',
    description = 'swap with left windwow',
    group       = 'layout',
    on_press    = function()
      awful.client.swap.bydirection("left")
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.ctrl},
    key         = 'k',
    description = 'swap upper windwow',
    group       = 'layout',
    on_press    = function()
      awful.client.swap.bydirection("up")
    end,
  },
  awful.key{
    modifiers   = {mod.super, mod.ctrl},
    key         = 'j',
    description = 'swap with bottom windwow',
    group       = 'layout',
    on_press    = function()
      awful.client.swap.bydirection("down")
    end,
  },
  --------------- screen managment
  awful.key{
    modifiers   = {mod.super},
    key         = 'n',
    description = 'focus the next screen',
    group       = 'screen',
    on_press    = function() awful.screen.focus_relative(1) end,
  },
  --------------- awesome commands
  awful.key{
    modifiers   = {mod.super, mod.ctrl},
    key         = 'r',
    description = 'reload awesome',
    group       = 'awesome',
    on_press    = awesome.restart,
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'q',
    description = 'quit awesome',
    group       = 'awesome',
    on_press    = awesome.quit,
  },
  -- awful.key{
  --   modifiers   = {mod.super},
  --   key         = 'r',
  --   description = 'run prompt',
  --   group       = 'launcher',
  --   on_press    = function() awful.screen.focused().promptbox:run() end,
  -- },
  --------------- layout managment
  awful.key{
    modifiers   = {mod.super},
    key         = 'm',
    description = 'select next',
    group       = 'layout',
    on_press    = function() awful.layout.inc(1) end,
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    key         = 'm',
    description = 'select previous',
    group       = 'layout',
    on_press    = function() awful.layout.inc(-1) end,
  },
  --------------- Desktop Managment
  awful.key{
    modifiers   = {mod.super},
    key         = 'Left',
    description = 'view previous',
    group       = 'tag',
    on_press    = awful.tag.viewprev,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'Right',
    description = 'view next',
    group       = 'tag',
    on_press    = awful.tag.viewnext,
  },
  awful.key{
    modifiers   = {mod.super},
    key         = 'Escape',
    description = 'go back',
    group       = 'tag',
    on_press    = awful.tag.history.restore,
  },
  awful.key{
    modifiers   = {mod.super},
    keygroup    = 'numrow',
    description = 'only view tag',
    group       = 'tag',
    on_press    = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end
  },
  awful.key{
    modifiers   = {mod.super, mod.shift},
    keygroup    = 'numrow',
    description = 'move focused client to tag',
    group       = 'tag',
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  },
  -- awful.key{
  --   modifiers   = {mod.super, mod.ctrl},
  --   key         = 'h',
  --   description = 'increase the number of columns',
  --   group       = 'layout',
  --   on_press    = function() awful.tag.incncol(1, nil, true) end,
  -- },
  -- awful.key{
  --   modifiers   = {mod.super, mod.ctrl},
  --   key         = 'l',
  --   description = 'decrease the number of columns',
  --   group       = 'layout',
  --   on_press    = function() awful.tag.incncol(-1, nil, true) end,
  -- },
}
