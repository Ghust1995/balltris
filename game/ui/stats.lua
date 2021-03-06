
--[[
require 'ui/base'
-- Player stats
Text{
  name='stat title',
  layer=LAYER_HUD,
  condition=inGameState(STATE_GAME_OVER),
  x=BORDER_THICKNESS/2,
  y=10*UI_HEIGHT_UNIT, 
  font=FONT_MD,
  color=COLOR_WHITE,
  width=BORDER_THICKNESS,
  getText = function()
    return 'stats'
  end,
}

Text{
  name='stat totalBalls',
  layer=LAYER_HUD,
  condition=And(
    function() return Game.stats ~= nil end,
    inGameState(STATE_GAME_OVER)
    ),
  x=BORDER_THICKNESS/2,
  y=12*UI_HEIGHT_UNIT,
  font=FONT_XS,
  color=COLOR_WHITE,
  width=BORDER_THICKNESS,
  getText = function()
    local str = ''
    for k, v in pairs(Game.stats) do
      str = str..string.format('%s\n%4.2f\n', k, Game.stats[k])
    end
    return str
  end,
}

-- Leaderboard stats

local i = 0
for k, v in pairs(Game.highscore.stats) do
  Text{
    name='stat totalBalls',
    layer=LAYER_HUD,
    condition=And(
      inGameState(STATE_GAME_MAINMENU, STATE_GAME_LEADERBOARD)
      ),
    x=BORDER_THICKNESS/2,
    y=12*UI_HEIGHT_UNIT + 2.0 * UI_HEIGHT_UNIT * i,
    font=FONT_XS,
    color=COLOR_WHITE,
    width=BORDER_THICKNESS,
    getText = function()
      return string.format('%s\n%4.2f', k, Game.highscore.stats[k])
    end,
  }
  i = i + 1
end

