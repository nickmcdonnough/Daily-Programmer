#
# Solution for Challenge #140 [Intermediate]
# http://redd.it/1t6dlf
#

n = File.readlines('adj_mat.txt')[0].split[0].to_i
m = File.readlines('adj_mat.txt')[0].split[1].to_i
d = File.readlines('adj_mat.txt')[1..-1].map { |x| x.chomp }

mat = (0..n-1).map { Array.new(m, 0) }

graph = d.inject({}) do |hsh, input|
  a = input.split('->')
  b = a[0].gsub(/\D/, ' ').split.map { |x| x.to_i }
  c = a[1].gsub(/\D/, ' ').split.map { |x| x.to_i }

  if b.size == 1
    if hsh.key?(b[0])
      hsh.merge(b[0] => hsh[b[0]].push(c))
    else
      hsh.merge(b[0] => c)
    end
  else
    b.each do |n|
      hsh.merge(n => hsh[n].push(c))
    end
  end
end

def build_matrix(graph, keys, matrix)
  return matrix if keys.size == 0
  k = keys.shift
  v = graph[k]
  if v.size == 1
    matrix[k][v[0]] = 1
  else
    v.each do |x|
      matrix[k][x[0]] = 1
    end
  end
  build_matrix(graph, keys, matrix)
end

build_matrix(
  graph,
  graph.keys,
  mat
).each { |x| puts x.join }