local Audio = {
  effectScoreRed = love.audio.newSource("/Music/scoreRed.mp3", "static"),
  effectScoreBlue = love.audio.newSource("/Music/scoreBlue.mp3", "static"),
  effectHunterHook = love.audio.newSource("/Music/Hook.mp3", "static"),
  levelAudio = love.audio.newSource("/Music/Level.mp3"),
  menuAudio = love.audio.newSource("/Music/Menu.mp3"),
  rabbitJumpAudio = love.audio.newSource("/Music/Hook.mp3", "static"),
  SpringAudio = love.audio.newSource("/Music/springBounce.mp3", "static"),
}

return Audio