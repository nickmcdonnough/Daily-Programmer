#
# Solution for Challenge #143 [Easy]
# http://redd.it/1s061q
#

alphabet = {
  "a" => [[1,0],[0,0],[0,0]],
  "b" => [[1,0],[1,0],[0,0]],
  "c" => [[1,0],[0,0],[0,0]],
  "d" => [[1,1],[0,1],[0,0]],
  "e" => [[1,0],[0,1],[0,0]],
  "f" => [[1,1],[1,0],[0,0]],
  "g" => [[1,1],[1,1],[0,0]],
  "h" => [[1,0],[1,1],[0,0]],
  "i" => [[0,1],[1,0],[0,0]],
  "j" => [[0,1],[1,1],[0,0]],
  "k" => [[1,0],[0,0],[1,0]],
  "l" => [[1,0],[1,0],[1,0]],
  "m" => [[1,1],[0,0],[1,0]],
  "n" => [[1,1],[0,1],[1,0]],
  "o" => [[1,0],[0,1],[1,0]],
  "p" => [[1,1],[1,0],[1,0]],
  "q" => [[1,1],[1,1],[1,0]],
  "r" => [[1,0],[1,1],[1,0]],
  "s" => [[0,1],[1,0],[1,0]],
  "t" => [[0,1],[1,1],[1,0]],
  "u" => [[1,0],[0,0],[1,1]],
  "v" => [[1,0],[1,0],[1,1]],
  "x" => [[1,1],[0,0],[1,1]],
  "y" => [[1,1],[0,1],[1,1]],
  "z" => [[1,0],[0,1],[1,1]],
  "and" => [[1,1],[1,0],[1,1]],
  "for" => [[1,1],[1,1],[1,1]],
  "of" => [[1,0],[1,1],[1,1]],
  "the" => [[0,1],[1,0],[1,1]],
  "with" => [[0,1],[1,1],[1,1]],
  "ch" => [[1,0],[0,0],[0,1]],
  "gh" => [[1,0],[1,0],[0,1]],
  "sh" => [[1,1],[0,0],[0,1]],
  "th" => [[1,1],[0,1],[0,1]],
  "wh" => [[1,0],[0,1],[0,1]],
  "ed" => [[1,1],[1,0],[0,1]],
  "er" => [[1,1],[1,1],[0,1]],
  "ou" => [[1,0],[1,1],[0,1]],
  "ow" => [[0,1],[1,0],[0,1]],
  "w" => [[0,1],[1,1],[0,1]],
  "ea" => [[0,0],[1,0],[0,0]],
  "bb" => [[0,0],[1,0],[1,0]],
  "cc" => [[0,0],[1,1],[0,0]],
  "dd" => [[0,0],[1,1],[0,1]],
  "en" => [[0,0],[1,0],[0,1]],
  "ff" => [[0,0],[1,1],[1,0]],
  "gg" => [[0,0],[1,1],[1,1]],
  "in" => [[0,0],[0,1],[1,0]]
}

def readbraille n
  f = File.readlines("braille.txt")[n].chomp.gsub(' ', '').gsub(/[.O]/, "O"=>1, "."=>0).split(//)
  j = f.map {|x| x.to_i}
  j.each_slice(2).to_a
end

a = readbraille 0
b = readbraille 1
c = readbraille 2

translation = ''

braille = [a,b,c].transpose

braille.each do |x|
  translation << alphabet.key(x)
end

puts translation
