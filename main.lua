local tween = require('tween')
local ghost = nil
local gd = { sx = 1, sy = 1, r = 0 }
local r = 0
local t = tween.new(3, gd, { sx = 10, sy = 10, r = math.pi * 2}, 'inBounce')

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest', 1)
  ghost = love.graphics.newImage('ghost.png')
end

local quantum = 1 / 60
local elapsed = 0

function love.update(dt)
  elapsed = elapsed + dt
  while elapsed >= quantum do
    r = r + .07
    elapsed = elapsed - quantum
  end
  t:update(dt)
end

function love.draw()
  love.graphics.translate(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  love.graphics.draw(ghost, 0, 0, gd.r, gd.sx, gd.sy, ghost:getWidth()/2, ghost:getHeight()/2)
end
