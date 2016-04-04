-- Configuration
function love.conf(t)
  t.title = "apathy" -- Title of window (string)
  t.author = "evldandy"
  t.version = "0.10.1"    -- Version of LÖVE game designed for (string)
  t.identity = "apathy"
  t.window.width = 720    -- Width of window game drawn in (int)
  t.window.height = 480   -- Height of window game drawn in (int)

  t.window.borderless = true
  t.window.vsync = true

  -- For Windows debugging
  t.console = true
end
