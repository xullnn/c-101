# Understanding the problem

  # turn float number into the representation of degrees, with formal degree unit
  # float part
    # integer part
      # copy directly
    # fraction part
    # formatting the 3 part of numbers
  # allocate appropriate units to every part

# Examples and Test cases

  # dms(30) == %(30°00'00")
  # dms(76.73) == %(76°43'48")
  # dms(254.6) == %(254°36'00")
  # dms(93.034773) == %(93°02'05")
  # dms(0) == %(0°00'00")
  # dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data structure
  # input is a float
  # output is string
  # while processing:
    # integer
    # float
    # string

# Algorithm

  # partition input float into 2 parts
    # integer part % 360, then to_i
    # 1 degree equals 3600 seconds so
      # multiply 3600 by fraction part number get total seconds
      # then use divmod(60) get minutes and seconds
  # formatting
    # use format("%02d\xC2\xB0%02d\'%02d\"", d,m,s)
DEGREE = "\xC2\xB0"

def dms(num)
  if num >= 0
    d = (num % 360).to_i
    m,s = (num % 1 * 3600).to_i.divmod(60)
    format("%02d#{DEGREE}%02d\'%02d\"", d,m,s)
  else
    d = num.to_i % -360
    if (f = num % 1) != 0
      d -= 1
      m,s = (3600 - f * 3600).to_i.divmod(60)
    else
      m,s = 0,0
    end
  end
  format("%02d#{DEGREE}%02d\'%02d\"",d,m,s)
end

# further exploration
# how to handle negative numbers

# key point:
  # when it is just a negative integer, then there's almost not dif
  # when the fraction part is not zero , we should consider Decimal abdicatating
    # first minus 1 degree from then integer part (it equals we get 3600seconds for subtracting)
    # cal the seconds representing of fraction part x
    # 3600 minus x to get exact seconds
    # apply same procedure in the previouse method

def dms(num)
  num < 0 ?
end
