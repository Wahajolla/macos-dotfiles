local padding <const> = {
  background = 8,
  icon = 8,
  label = 8,
  bar = 8,
  item = 18,
  popup = 8,
}

local graphics <const> = {
  bar = {
    height = 22,
    offset = 8,
  },
  background = {
    height = 24,
    corner_radius = 12,
  },
  slider = {
    height = 20,
  },
  popup = {
    width = 200,
    large_width = 300,
  },
  blur_radius = 30,
}

local text <const> = {
  icon = 14.0,
  label = 12.0,
}

return {
  padding = padding,
  graphics = graphics,
  text = text,
}
