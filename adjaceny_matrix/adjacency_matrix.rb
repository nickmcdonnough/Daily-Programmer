#
# Solution for Challenge #140 [Intermediate]
# http://redd.it/1t6dlf
#
@adj = []
@nodes = {}

n = File.readlines('adj_mat.txt')[0].split[0].to_i
d = File.readlines('adj_mat.txt')[1..-1].map { |x| x.chomp }

n.times { @adj << Array.new(n, 0) }

def find_relationships(x, y)
  if x.size == 1
    if @nodes.key?(x[0])
      @nodes[x[0]] << y
    else
      @nodes.merge!(x[0] => y)
    end
  else
    x.each do |n|
      @nodes.merge!(n => @nodes[n] << y)
    end
  end
end

d.each do |x|
  a = x.split('->')
  b = a[0].split.map { |x| x.to_i }
  c = a[1].split.map { |x| x.to_i }
  find_relationships(b, c)
end

@nodes.each_pair do |k, v|
  if v.size == 1
    @adj[k][v[0]] = 1
  else
    v.each do |x|
      @adj[k][x[0]] = 1
    end
  end
end

@adj.each { |x| puts x.join }