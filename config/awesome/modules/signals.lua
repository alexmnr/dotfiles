local awful = require'awful'
local beautiful = require'beautiful'
require'awful.autofocus'

--------------- Window Management
client.connect_signal("manage", function (c)
  if not awesome.startup then awful.client.setslave(c) end
end)

client.connect_signal("focus", function(c)
                              c.border_color = beautiful.border_focus
                              c.opacity = 1
                           end)
client.connect_signal("unfocus", function(c)
                                c.border_color = beautiful.border_normal
                                c.opacity = 0.7
                             end)

--------------- Error Management
local naughty = require'naughty'

naughty.connect_signal('request::display_error', function(message, startup)
   naughty.notification{
      urgency = 'critical',
      title = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
      message = message
   }
end)

naughty.connect_signal('request::display', function(n)
   naughty.layout.box{notification = n}
end)


--------------- Notifications Management
local ruled = require'ruled'

ruled.notification.connect_signal('request::rules', function()
   -- All notifications will match this rule.
   ruled.notification.append_rule {
      rule       = {},
      properties = {
         screen           = awful.screen.preferred,
         implicit_timeout = 5,
      }
   }
end)

--------------- Desktop Decorations
local vars = require'config.vars'

awful.screen.connect_for_each_screen(function(s)
   awful.tag(vars.tags, s, awful.layout.layouts[1])
end)
