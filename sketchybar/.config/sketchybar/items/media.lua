local colors = require('config.colors')
local app_icons = require('config.icons')

local whitelist = {
  ['Spotify'] = true,
  ['Music'] = true,
  ['Podcasts'] = true,
  ['VLC'] = true,
  ['IINA'] = true,
  ['Zen'] = true
};

--  label = {
--         padding_left = 0,
--         string = windowName,
--       },
--       icon = {
--         string = icon,
--         font = settings.fonts.icons(),
--       },

local media = sbar.add('item', 'media', {
  icon = {
    color = colors.media,
  },
  label = {
    width = 320,
    padding_right = 60,
    color = colors.media,
    background = {
      color = colors.inactive_bg,
      corner_radius = 10,
      height = 24,
    }
  },
  position = 'center',
  updates = true,
  background = {
    color = colors.inactive_bg,
    corner_radius = 10,
    height = 24,
  },
  width = 32,
})

-- local function animate_media_width(width)
--   sbar.animate('tanh', 30.0, function()
--     media:set({ label = { width = width } })
--   end)
-- end

-- media:subscribe('mouse.entered', function()
--   local text = media:query().label.value
--   animate_media_width(#text * 10) -- adjust depending on font width
-- end)
-- media:subscribe('mouse.exited', function()
--   animate_media_width(20)
-- end)
media:subscribe('mouse.clicked', function(env)
  sbar.exec('shortcuts run "playpause"')
end)

media:subscribe('media_change', function(env)
  if whitelist[env.INFO.app] then
    local lookup = app_icons[env.INFO.app]
    local icon = ((lookup == nil) and app_icons['default'] or lookup)

    local playback_icon = ((env.INFO.state == 'playing') and '' or '')

    local artist = (env.INFO.artist ~= "" and env.INFO.artist) or "Unknown Artist"
    local title = (env.INFO.title ~= "" and env.INFO.title) or "Unknown Title"
    local label = playback_icon .. ' ' .. artist .. ': ' .. title

    sbar.animate('tanh', 10, function()
      media:set({
        icon = { string = icon },
        label = label
      })
    end)
  end
end)
