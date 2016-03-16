-- include
require('bin/camera')

-- norms
debug = true

-- Placeholders

-- Timers

-- Game Data

function love.load()
  -- initial setup
  visitorFont = love.graphics.newFont('assets/visitor1.ttf', 14)
  love.graphics.setFont(visitorFont)
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  love.graphics.setBackgroundColor(0, 0, 255)
  vin = love.graphics.newImage('assets/images/vin.png')

  -- tile redyieeer
  Tileset = love.graphics.newImage('assets/images/countryside.png')
  TileW, TileH = 32, 32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  Quads = {
    love.graphics.newQuad(0, 0, TileW, TileH, tilesetW, tilesetH), -- 1 = grass
    love.graphics.newQuad(32, 0, TileW, TileH, tilesetW, tilesetH), -- 2 = box
    love.graphics.newQuad(0, 32, TileW, TileH, tilesetW, tilesetH), -- 3 = flowers
    love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH) -- 4 = boxtop
  }
  MyGlobalTable = {}
  TileTable = {
    { 1,1,2 },
    { 1,2,1 },
    { 1,1,1 }
  }
end

function love.update(dt)
  -- Escape the game
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  if love.keyboard.isDown("up") then
    camera.y = camera.y - 1
  end
end

function love.draw()
  camera:set()
  -- here be things
  love.graphics.setColor(255, 255, 255)
  love.graphics.print('Go Fuck yourself', 0, 0)
  love.graphics.draw(vin, camera.x, camera.y)

  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      love.graphics.draw(Tileset, Quads[number], (columnIndex-1)*TileW, (rowIndex-1)*TileH)
    end
  end
  camera:unset()
end
