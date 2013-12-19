# 
# Solution for Challenge #122 [Easy]
# http://redd.it/1berjh
#

def root(i)
  z = i.to_s.split('')
  if z.size > 1
    z.collect!{|x| x.to_i}
    a = z.inject(0){|sum,y| sum+=y}
    root a
  else
    puts i
  end
end

num = gets.to_i
root num