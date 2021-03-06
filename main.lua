local tween = require('tween')
local ghost = nil
local gd = { sx = 1, sy = 1, r = 0, a = 128 }
local r = 0
local t = tween.new(3, gd, { sx = 15, sy = 15, r = math.pi * 4, a = 255}, 'inBounce')

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest', 1)
  ghost = love.graphics.newImage('ghost.png')
end

local quantum = 1 / 60
local elapsed = 0

function love.update(dt)
  t:update(dt)
end

function love.keypressed(key)
  t:reset()
end

function love.draw()
  love.graphics.translate(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  love.graphics.setColor(255, 255, 255, gd.a)
  love.graphics.draw(ghost, 0, 0, gd.r, gd.sx, gd.sy, ghost:getWidth()/2, ghost:getHeight()/2)
end
