-- include
require('bin/camera')

-- norms
debug = true

-- Placeholders

-- Timers

-- Game Data

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

end

function love.update(dt)
  -- Escape the game
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  if love.keyboard.isDown("up") then
    camera.y = camera.y + 1
  end
end

function love.draw()
  camera:set()
  -- here be things
  love.graphics.print('Go Fuck yourself', 0, 0)
  camera:unset()

end
