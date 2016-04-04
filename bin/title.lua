function drawTitle()

if love.mouse.isDown('1') then
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  if x >= 3 and x <= 45 and y >= (height - 40) and y <= height then
    love.event.quit()
  end
end

love.graphics.print("continue", 5, height - 75)
love.graphics.print("new game", 5, height - 60)
love.graphics.print("options", 5, height - 45)
love.graphics.print("exit", 5, height - 30)

love.graphics.print("love2d 0.10.1", width - 89, height - 30)
love.graphics.print("apathy v0.01", width - 90, height - 15)
end

function drawOptions()
love.graphics.print("video", 5, height - 90)
love.graphics.print("audio", 5, height - 75)
love.graphics.print("controls", 5, height - 60)
love.graphics.print("credits", 5, height - 45)
love.graphics.print("back", 5, height - 30)
end

function clearTitle()

end
