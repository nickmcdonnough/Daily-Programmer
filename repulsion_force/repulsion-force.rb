def dxy ax, ay, bx, by
  dx = (ax - bx)
  dy = (ay - by)
  ((dx*dx)+(dy*dy))**0.5
end

datax = gets.split.map{|i| i.to_f}
datay = gets.split.map{|i| i.to_f}

puts ((datax[0]*datay[0]) / dxy(datax[1], datax[2], datay[1], datay[2])**2).round(4)