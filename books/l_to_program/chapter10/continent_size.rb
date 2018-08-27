M = "land"
O = "water"

world = [
  [O,O,O,O,O,O,O,O,O,O,O],
  [O,O,O,O,M,M,O,O,O,O,O],
  [O,O,O,O,O,O,O,O,M,M,O],
  [O,O,O,M,O,O,O,O,O,M,O],
  [O,O,O,M,O,M,M,O,O,O,O],
  [O,O,O,O,M,M,M,M,O,O,O],
  [O,O,O,M,M,M,M,M,M,M,O],
  [O,O,O,M,M,O,M,M,M,O,O],
  [O,O,O,O,O,O,M,M,O,O,O],
  [O,M,O,O,O,M,O,O,O,O,O],
  [O,O,O,O,O,O,O,O,O,O,O]
]

# the purpose of this program is to calculate the area of current standing land
# the key point is 'continuous'
# this is why it directly returns 0 when meeting a non-land cell

def continent_size(world, x, y)
  if world[y][x] != 'land'
    return 0
  end
  size = 1
  world[y][x] = 'counted land'
  size = size + continent_size(world, x-1, y-1)
  size = size + continent_size(world, x, y-1)
  size = size + continent_size(world, x+1, y-1)
  size = size + continent_size(world, x-1, y)
  size = size + continent_size(world, x+1, y)
  size = size + continent_size(world, x-1, y+1)
  size = size + continent_size(world, x, y+1)
  size = size + continent_size(world, x+1, y+1)
  size
end

puts continent_size(world, 5, 5)

# special case
  # only (5,5) is M

# size = 1
# world[y][x] = "counted land"
# size = size + 0
# size = size + 0
# size = size + 0
# ......
#
# size => 1
