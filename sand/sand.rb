#
# Solution for Challenge #142 [Easy]
# http://redd.it/1rdtky
#

world, gworld = [], []

File.open('world.txt', 'r') do |x|
  lines = x.lines
  s = lines.first.to_i
  lines.each do |line|
    newline = line.chomp
    if newline.size < s
      newline << ' '*(s - newline.size)
      world << newline.split(//)
    else
      world << newline.split(//)
    end
  end
end

def gravity col
  a = col.join.split('#').map {|x| x.split(//).sort}
  b = a.map {|x| x.join}
  b.join('#').split(//)
end

columns = world.transpose
columns.each {|x| gworld.push(x.include?('#') ? gravity(x) : x.sort)}

gworld.transpose.each {|x| puts x.join}