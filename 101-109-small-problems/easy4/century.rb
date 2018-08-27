# quotient on 100
# remainder on 100
 # remainder == 0 then equal to quotient
 # and != 0 then equal to quotient + 1

def century(year)
  q,r = year.divmod(100)
  if r == 0
    century = q.to_s
  else
    century = (q + 1).to_s
  end
  case century % 10
  when 1
    century + 'st'
  when 2
    century + 'nd'
  when 3
    century + 'rd'
  else
    century + 'th'
  end
end
