-- Misc
TITLE = 'BallTris'


METER = 64
GRAVITY = 10 * METER

-- Screen
BASE_SCREEN_WIDTH = 640
BASE_SCREEN_HEIGHT = 960
ASPECT_RATIO = 2/3
BORDER_THICKNESS = 200
BOTTOM_THICKNESS = 50

-- Ball
BASE_RADIUS = 25
RADIUS_MULTIPLIERS = {1, 1.7, 2.5}
MAX_RADIUS = BASE_RADIUS * 2.23
NUM_COLORS = 5
BALL_SATURATION = 0.8
BALL_VALUE = 0.9
WHITE_BALL_BORDER_COLOR = {90, 90, 90}
WHITE_BALL_BORDER_WIDTH = 5

-- Preview
PREVIEW_SPEED = 200
PREVIEW_PADDING = 5

-- Minimum value definitions
MIN_SPEED2 = 50

-- Collision
COL_MAIN_CATEGORY = 1

--Input
INPUT_SWITCH_BALL = 'c'
INPUT_RELEASE_BALL = 'space'

-- Game End
MIN_DISTANCE_TO_TOP = 100
