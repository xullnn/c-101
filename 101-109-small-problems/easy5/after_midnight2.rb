# get hours and minutes(regexp + to_i)
# if after
  # h * 60 + minutes
# if before
  # first turn it to after
    # +h = 24 - h
    # +min = 60 - min
  # then takcle it with the logic of after

def hour_and_minutes(time)
  m = time.match /(\d+).(\d+)/
  m.captures.map { |x| x.to_i }
end

def after_midnight(time)
  h, m = hour_and_minutes(time)
  h %= 24
  h * 60 + m
end

def before_midnight(time)
  h, m = hour_and_minutes(time)
  h = 24 - h
  if m != 0
    m = 60 - m
    h -= 1
  end
  h * 60 + m
end
