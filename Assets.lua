local Assets = {
    box1 = love.graphics.newImage( 'Assets/box1-32px.png' ),
    bg1 = love.graphics.newImage( 'Assets/bg1.png' ),
    frame1 = love.graphics.newImage( 'Assets/frame1.png' ),

    rectangleShape = love.physics.newRectangleShape(32, 32),
    
    --HOOK
    hookLeft   = love.graphics.newImage( 'Assets/hook_beta_left.png' ),
    hookRight  = love.graphics.newImage( 'Assets/hook_beta_right.png' ),
    --BASE
    homeBase  = love.graphics.newImage( 'Assets/base.png' ),
    --HUNTER
    hunterBlueMoveRight = love.graphics.newImage( 'Assets/hunter-blue-walk-right.png' ), 
    hunterBlueMoveLeft = love.graphics.newImage( 'Assets/hunter-blue-walk-left.png' ), 
    hunterRedMoveRight = love.graphics.newImage( 'Assets/hunter-red-walk-right.png' ), 
    hunterRedMoveLeft = love.graphics.newImage( 'Assets/hunter-red-walk-left.png' ), 
    hunterRedLadder = love.graphics.newImage( 'Assets/hunter-red-ladder.png'),
    hunterBlueLadder = love.graphics.newImage( 'Assets/hunter-blue-ladder.png'),
    hunterRabbitBlueRight = love.graphics.newImage( 'Assets/hunterRabbitBlueRight.PNG'),
    hunterRabbitBlueLeft = love.graphics.newImage( 'Assets/hunterRabbitBlueLeft.PNG'),
    hunterRabbitRedRight = love.graphics.newImage( 'Assets/hunterRabbitRedRight.png'),
    hunterRabbitRedLeft = love.graphics.newImage( 'Assets/hunterRabbitRedLeft.png'),
    hunterRabbitLadderRed = love.graphics.newImage( 'Assets/hunter_rabbit-climb_red.PNG'),
    hunterRabbitLadderBlue = love.graphics.newImage( 'Assets/hunter_rabbit-climb_blue.PNG'),
    hunterRedArmRight = love.graphics.newImage( 'Assets/hunter_arm-red.png'),
    hunterRedArmLeft = love.graphics.newImage( 'Assets/hunter_arm-red-left.png'),
    hunterBlueArmRight = love.graphics.newImage( 'Assets/hunter_arm-blue.png'),
    hunterBlueArmLeft = love.graphics.newImage( 'Assets/hunter_arm-blue-left.png'),
    
    --RABBIT
    rabbitMoveRight = love.graphics.newImage( 'Assets/rabbitWalkRight.png' ), 
    rabbitMoveLeft = love.graphics.newImage( 'Assets/rabbitWalkLeft.png' ), 
    rabbitInHomeBase = love.graphics.newImage( 'Assets/rabbit_homebase.png' ), 
    rabbitJumpUpLeft = love.graphics.newImage('Assets/rabbitupleft.png'),
    rabbitJumpUpRight = love.graphics.newImage('Assets/rabbitupright.png'),
    rabbitJumpDownLeft = love.graphics.newImage('Assets/rabbitdownleft.png'),
    rabbitJumpDownRight = love.graphics.newImage('Assets/rabbitdownright.png'),
    rabbitJumpRight = love.graphics.newImage('Assets/rabbitJumpingRight.png'),
    rabbitJumpLeft = love.graphics.newImage('Assets/rabbitJumpingLeft.png'),
    rabbitJumpDownRight = love.graphics.newImage('Assets/rabbitJumpingDownRight.png'),
    rabbitJumpDownLeft = love.graphics.newImage('Assets/rabbitJumpingDownLeft.png'),

    --BACKGROUND
    endRedTeamWins = love.graphics.newImage( 'Assets/teamRedWins.png' ), 
    endBlueTeamWins = love.graphics.newImage( 'Assets/teamBlueWins.png' ), 
    endTie = love.graphics.newImage( 'Assets/itsTie.png' ),
    startBackground = love.graphics.newImage( 'Assets/STARTpage.png' ), 
    optionBackground = love.graphics.newImage( 'Assets/OptionPage.png' ),
    
    
}


return Assets
