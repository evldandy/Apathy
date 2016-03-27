-- require
require('bin/camera')

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
  hp_container = love.graphics.newImage('assets/images/hud/health_container.png')
  -- Player stuff
  player = { img = love.graphics.newImage('assets/images/player.png'), speed = 150, health = 10, energy = 3, sx = 2 }
  player.x = (width / 2) - (player.img:getWidth() / 2)
  player.y = (height / 2) - (player.img:getHeight() / 2)
  -- Player stats
  energy = { img1 = love.graphics.newImage('assets/images/hud/energy1.png'),
             img2 = love.graphics.newImage('assets/images/hud/energy2.png'),
             img3 = love.graphics.newImage('assets/images/hud/energy3.png'),
             blank = love.graphics.newImage('assets/images/blank.png'),
             x = camera.x + 70, y = camera.y + 10 }
  health = { img1 = love.graphics.newImage('assets/images/hud/health1.png'),
             img2 = love.graphics.newImage('assets/images/hud/health2.png'),
             img3 = love.graphics.newImage('assets/images/hud/health3.png'),
             img4 = love.graphics.newImage('assets/images/hud/health4.png'),
             img5 = love.graphics.newImage('assets/images/hud/health5.png'),
             img6 = love.graphics.newImage('assets/images/hud/health6.png'),
             img7 = love.graphics.newImage('assets/images/hud/health7.png'),
             img8 = love.graphics.newImage('assets/images/hud/health8.png'),
             img9 = love.graphics.newImage('assets/images/hud/health9.png'),
             img10 = love.graphics.newImage('assets/images/hud/health10.png'),
             blank = love.graphics.newImage('assets/images/blank.png'),
             x = camera.x + 5, y = camera.y + 5 }
end

function love.update(dt)

  function playersHealth(x, y)
    if player.health == 1 then
      love.graphics.draw(health.img1, x, y)
    elseif player.health == 2 then
      love.graphics.draw(health.img2, x, y)
    elseif player.health == 3 then
      love.graphics.draw(health.img3, x, y)
    elseif player.health == 4 then
      love.graphics.draw(health.img4, x, y)
    elseif player.health == 5 then
      love.graphics.draw(health.img5, x, y)
    elseif player.health == 6 then
      love.graphics.draw(health.img6, x, y)
    elseif player.health == 7 then
      love.graphics.draw(health.img7, x, y)
    elseif player.health == 8 then
      love.graphics.draw(health.img8, x, y)
    elseif player.health == 9 then
      love.graphics.draw(health.img9, x, y)
    elseif player.health == 10 then
      love.graphics.draw(health.img10, x, y)
    elseif player.health == 0 then
      love.graphics.draw(health.blank, x, y)
    end
  end
  function playersEnergy()
    if player.energy == 1 then
      love.graphics.draw(energy.img1, energy.x, energy.y)
    end
    if player.energy == 2 then
      love.graphics.draw(energy.img2, energy.x, energy.y)
    end
    if player.energy == 3 then
      love.graphics.draw(energy.img3, energy.x, energy.y)
    end
    if player.energy == 0 then
      love.graphics.draw(energy.blank, energy.x, energy.y)
    end
  end

  if love.keyboard.isDown('1') then
    player.health = 9
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
    player.health = 10
    player.energy = 3
    isDead = false
    isGameOver = false
  end

  if isGameOver then
    gameReset()
  end

end

function love.draw()
camera:set()

playersHealth(health.x, health.y)
love.graphics.draw(vin, camera.x, camera.y)
love.graphics.draw(hp_container, health.x, health.y)
love.graphics.draw(player.img, player.x, player.y, nil, player.sx, 2)
playersEnergy()

camera:unset()
end
