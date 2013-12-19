#
# Solution for Challenge #137 [Easy]
# http://redd.it/1m1jam
#

s=File.read('transpose.txt')

a = s.split[0..-1]
p a
num = a.max_by(&:length).length
a.map!{|x| x + ' ' * (num - x.length)}
a.map!{|x| x.split(//)}
puts a.transpose.map(&:join)