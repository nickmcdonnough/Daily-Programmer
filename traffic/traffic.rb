# 
# Solution for Challenge #133 [Easy]
# http://redd.it/1iambu
# 

hsh,rooms,time = {},{},{}

File.open('traffic.txt','r').each_line do |x|
  a=x.split.unshift(x.split[1])
  a.delete_at(2)
  if hsh.key?(a[0].to_i)
    hsh[a[0].to_i]<<a[1..3] unless x.size < 4
  else
    hsh[a[0].to_i]=[a[1..3]] unless x.size < 4
  end
end

hsh.each do |k,arr|
  x=arr.sort_by{|a| [a[0],a[2]] }
  rooms.merge!(k=>x)
end

rooms.each do |k,arr|
  dur = 0
  arr.each_slice(2){|x| dur+=x[1][2].to_i-x[0][2].to_i}
  time.merge!(k=>[rooms[k].size / 2,dur])
end

Hash[time.sort].each do |k,arr|
  r, c, avg = k, arr[0], arr[1] / arr[0]
  puts "Room #{r}, #{avg} minute average visit, #{c} visitor#{c>1 ? 's' : nil}" + " total"
end