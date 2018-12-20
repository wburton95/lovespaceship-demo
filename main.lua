
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    require('player')
    require('bullet')
    playerbodies()
end

function love.update(dt)
    world:update(dt)
    pshipmath()
    pturretmath()

end

function love.draw()
    playerdraw()
end