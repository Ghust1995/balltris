require 'ui/base'
local TempSave = require 'tempsave'
local Backend = require 'backend'
local Scheduler = require 'lib/scheduler'

MUSIC_BPM = 90

local BlinkingText = function(textObj)
  textObj.colorF = MUSIC_BPM/60
  textObj.lastColorSwap = 0
  textObj.lastColor = math.floor(3 + math.random() * 5)
  textObj.getColor = function(self)
    if self.lastColorSwap + self.colorF < Game.totalTimeUnscaled then
      self.lastColor = math.floor(3 + math.random() * 5)
      self.lastColorSwap = Game.totalTimeUnscaled
    end
    return self.lastColor
  end
  return Text(textObj)
end

BlinkingText{
  name='subtitle',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=8*UI_HEIGHT_UNIT,
  font=FONT_XL,
  width=HOLE_WIDTH,
  getText = function()
    return 'ball'
  end,
}

BlinkingText{
  name='title',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=11*UI_HEIGHT_UNIT,
  font=FONT_XL,
  width=HOLE_WIDTH,
  getText = function()
    return 'tris'
  end,
}

Button{
  name='new game button',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=16*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=1,
  lineWidth=3,
  font=FONT_SM,
  textColor=1,
  getText = function() 
    return 'new game'
  end,
  onPress = function(self, x, y)
    TempSave.Clear()
    Game.start()
  end,
}

--[[
Button{
  name='continue button',
  layer=LAYER_MENUS,
  condition=And(
    inGameState(STATE_GAME_MAINMENU),
  function() return TempSave.CreateLoadFunc or false end),
  x=BASE_SCREEN_WIDTH/2,
  y=24*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=COLOR_GRAY,
  lineWidth=3,
  font=FONT_MD,
  getText = function() 
    return 'continue'
  end,
  onPress = function(self, x, y)
    -- TODO: fix
    -- Game.start(TempSave.CreateLoadFunc())
  end,
}
]]--

Button{
  name='continue button',
  layer=LAYER_MENUS,
  condition=And(inGameState(STATE_GAME_MAINMENU)),
  x=BASE_SCREEN_WIDTH/2,
  y=20*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=COLOR_WHITE,
  lineWidth=3,
  font=FONT_SM,
  getText = function() 
    return 'achievements'
  end,
  onPress = function(self, x, y)
    Game.state:push(STATE_GAME_ACHIEVEMENTS)
  end,
}

Button{
  name='leaderboard button',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=24*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=1,
  lineWidth=3,
  font=FONT_SM,
  textColor=1,
  getText = function() 
    return 'leaderboard'
  end,
  onPress = function(self, x, y)
    Game.state:push(STATE_GAME_LEADERBOARD)
    --if not Game.highscore.sentStats then
      --Backend.SendStats(Game.highscore.stats, Game.highscore.number)
    --end
end,
}

Text{
  name='HIGHSCORE',
  layer=LAYER_HUD,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BORDER_THICKNESS/2,
  y=6*UI_HEIGHT_UNIT,
  font=FONT_MD,
  color=1,
  width=BORDER_THICKNESS,
  getText = function()
    return string.format('best: \n%04d', Game.highscore.stats.score or 0)
  end,
}

Button{
  name='options button',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=28*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=1,
  lineWidth=3,
  font=FONT_SM,
  textColor=1,
  getText = function() 
    return 'options'
  end,
  onPress = function(self, x, y)
    Game.state:push(STATE_GAME_OPTIONS)
  end,
}

Button{
  name='credits button',
  layer=LAYER_MENUS,
  condition=inGameState(STATE_GAME_MAINMENU),
  x=BASE_SCREEN_WIDTH/2,
  y=32*UI_HEIGHT_UNIT,
  width=HOLE_WIDTH * 0.8,
  height=2*UI_HEIGHT_UNIT,
  color=0,
  lineColor=1,
  lineWidth=3,
  font=FONT_SM,
  textColor=1,
  getText = function() 
    return 'credits'
  end,
  onPress = function(self, x, y)
    Game.state:push(STATE_GAME_CREDITS)
  end,
}

