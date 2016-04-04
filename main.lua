-- require
require('bin/camera')
require('bin/title')

-- Debug info
debug = true

-- Game information
isGameOver = false
isDead = false
isPaused = false
isOoF = false
dir = love.filesystem.getSaveDirectory()

-- Player information



function love.load()
  fontVisitor1 = love.graphics.newFont('assets/visitor1.ttf', 14)
  love.graphics.setFont(fontVisitor1)
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  love.graphics.setBackgroundColor(56, 82, 102)
  vin = love.graphics.newImage('assets/images/hud/vin.png')

  player = { img = love.graphics.newImage('assets/images/player.png'), x = width / 2, y = height / 2, speed = 150, health = 100, stamina = 100, }
  hscontainer = { img = love.graphics.newImage('assets/images/hud/hscon.png'), x = camera.x, y = camera.y }
  health = { img = love.graphics.newImage('assets/images/hud/health.png') }
  stamina = { img = love.graphics.newImage('assets/images/hud/stamina.png') }
  -- Player stuff
  player = { img = love.graphics.newImage('assets/images/player.png'), speed = 150, health = 100, stamina = 100, sx = 2 }
  player.x = (width / 2) - (player.img:getWidth() / 2)
  player.y = (height / 2) - (player.img:getHeight() / 2)
  -- Player stats
  stamina = { img = love.graphics.newImage('assets/images/hud/stamina.png'), sx = player.stamina / 100 }
  health = { img = love.graphics.newImage('assets/images/hud/health.png'), sx = player.health / 100 }
end

function love.update(dt)

  if love.keyboard.isDown('escape') then
    love.event.quit()
  end

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

  function checkSaveDir()
    -- Checks if save file directory created
    love.filesystem.exists(dir)
  end

  if checkSaveDir() == false then
    love.filesystem.createDirectory(dir)
  end

  if love.keyboard.isDown('up', 'w') then
    player.y = player.y - (player.speed * dt)
  end
  if love.keyboard.isDown('down', 's') then
    player.y = player.y + (player.speed * dt)
  end
  if love.keyboard.isDown('right', 'd') then
    player.x = player.x + (player.speed * dt)
    player.sx = 2
  end
  if love.keyboard.isDown('left', 'a') then
    player.x = player.x - (player.speed * dt)
    player.sx = -2
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

  function gameInitiate()
    love.graphics.draw(vin, camera.x, camera.y)
    playerHealth(health.sx)
    playerStamina(stamina.sx)
    love.graphics.draw(hscontainer.img, hscontainer.x, hscontainer.y)
    love.graphics.draw(player.img, player.x, player.y, nil, player.sx, 2, 16)
    love.graphics.draw(vin, camera.x, camera.y)
  end

end

function love.draw()
camera:set()
drawTitle()


camera:unset()
end
