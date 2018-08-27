# use `divmod` to get raw h and m
# convert h to real h
# formatting work

def time_of_day(time)
  hour, minute = time.divmod(60)
  hour %= 24
  format_time(hour) + ":" + format_time(minute)
end

def format_time(time)
  if time < 10
    "0" + time.to_s
  else
    time.to_s
  end
end

# Further Exploration

# midnight between Saturday and Sunday is Sunday 00:00
# MINUTES_PER_DAY, MINUTES_PER_HOUR
# calculate delta day, hour, minute
# handle wday
  # require 'date'
  # use 't = DateTime.parse("Sunday, 00:00")' to create a date object
  # (t + delta day).wday to get wday
# handle hour and minute
  # just use the methods we had written

require 'date'
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 24 * 60

def wday(time)
  delta_day = time / MINUTES_PER_DAY
  d = DateTime.parse("Sunday, 00:00") + delta_day
  d.strftime('%A')
end

def time_of_day(time)
  hour, minute = time.divmod(MINUTES_PER_HOUR)
  hour %= 24
  wday(time) + format(' %02d:%02d', hour, minute)
end
