#
# Solution for Challenge #116 [Easy]
# http://redd.it/164zvs
#

a = gets.chomp
b = a.split("").permutation.map(&:join).uniq
puts b