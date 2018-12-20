function bulletload()
    bullet = {}
    bullet['image'] = love.graphics.newImage('/ships/bullet.png')
    bullet['body'] = love.physics.newBody(world,0,0,'dynamic')
    bullet['shape'] = love.physics.newRectangleShape(2,2)
    bullet['fixture'] = love.physics.newFixture(bullet.body,bullet.shape,10)
end

function pbulletmath()
end

function pbulletdraw()
end