-- require
require('bin/camera')

-- Debug info
debug = true

-- Game information
isGameOver = false
isDead = false
isPaused = false
isOoF = false

-- Player information



function love.load()
  fontVisitor1 = love.graphics.newFont('assets/visitor1.ttf', 14)
  love.graphics.setFont(fontVisitor1)
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  love.graphics.setBackgroundColor(56, 82, 102)
  vin = love.graphics.newImage('assets/images/hud/vin.png')
  player = { img = love.graphics.newImage('assets/images/player.png'), x = width / 2, y = height / 2, speed = 150, health = 33, stamina = 100, }
  hscontainer = { img = love.graphics.newImage('assets/images/hud/hscon.png'), x = camera.x, y = camera.y }
  health = { img = love.graphics.newImage('assets/images/hud/health.png') }
  stamina = { img = love.graphics.newImage('assets/images/hud/stamina.png') }


end

function love.update(dt)

  function playerHealth(sx)
    health.sx = player.health / 100
    love.graphics.draw(health.img, hscontainer.x, hscontainer.y, 0, sx, 1)
  end

  function playerStamina(sx)
    stamina.sx = player.stamina / 100
    love.graphics.draw(stamina.img, hscontainer.x, hscontainer.y, 0, sx, 1)
  end

  if love.keyboard.isDown('1') then
    player.health = 25
    player.stamina = 76
  end
  if love.keyboard.isDown('2') then
    isGameOver = true
  end

  function gameReset()
    player.health = 100
    player.stamina = 100
    isDead = false
    isGameOver = false
  end

  if player.health <= 0 then
    isGameOver = true
  end

  if isGameOver then
    gameReset()
  end

end

function love.draw()
camera:set()
love.graphics.draw(vin, camera.x, camera.y)
playerHealth(health.sx)
playerStamina(stamina.sx)
love.graphics.draw(hscontainer.img, hscontainer.x, hscontainer.y)
love.graphics.print(health.sx, width / 2, height / 2)

camera:unset()
end
