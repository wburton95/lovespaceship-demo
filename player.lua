function playerbodies()
    
    world = love.physics.newWorld(0,0,true)

    require('bullet')
    
    --Table for ship object

    redship = {}
    redship['body'] = love.physics.newBody(world, 0, 0, "dynamic")
    redship['shape'] = love.physics.newRectangleShape(5,5)
    redship['image'] = love.graphics.newImage("/ships/red-ship.png")
    redship['fixture'] = love.physics.newFixture(redship.body,redship.shape,10)

    --Table for gun object.

    gun = {}
    gun['body'] = love.physics.newBody(world, 0, 0, "dynamic")
    gun['shape'] = love.physics.newRectangleShape(1,1)
    gun['image'] = love.graphics.newImage('/ships/big gun.png')
    gun['fixture'] = love.physics.newFixture(gun.body,gun.shape,10)

    
end
function pshipmath()
    
    --Setting the damping for movement.
    redship.body:setLinearDamping(0.5)
    redship.body:setAngularDamping(0.5)
    
    --Finding the foward direction and multiplying for ship movement.
    local angle = redship.body:getAngle()
    local y = math.cos(angle) * 10
    local x = math.sin(angle) * 10
    
    --Applying the foward movement.
    if love.keyboard.isDown("w") then
        redship.body:applyForce(-x, y)
    elseif love.keyboard.isDown("s") then
        redship.body:applyForce(x, -y)
    end

    --Applying rotation.
    if love.keyboard.isDown('d') then
        redship.body:applyTorque(0.8)
    elseif love.keyboard.isDown('a') then
        redship.body:applyTorque(-0.8)
    else
        redship.body:applyTorque(0)
    end
    
    
end

function pturretmath()
        --Point the gun at the cursor.
        local gx, gy = redship.body:getTransform()
        local mx, my = love.mouse.getPosition()
        local mx, my = mx / 3, my / 3
        local pos = math.atan2((mx - gx), (my - gy))
        gun.body:setAngle(-pos)
end

function playerdraw()
    love.graphics.push()
    love.graphics.scale(3,3)
    love.graphics.draw(redship.image, redship.body:getX(), redship.body:getY(), redship.body:getAngle(), 1, 1, redship.image:getWidth()/2, redship.image:getHeight()/2)
    love.graphics.draw(gun.image, redship.body:getX(), redship.body:getY(), gun.body:getAngle(), 1, 1, gun.image:getWidth() / 2, gun.image:getHeight()/2)
    love.graphics.pop()
end