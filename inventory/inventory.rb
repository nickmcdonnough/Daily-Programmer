#
# Solution for Challenge #144 [Easy]
# http://redd.it/1sob1e
#

def read_inv x
  File.readlines('inventory.txt')[x]
end

inv_start_hsh = {}
inv_end_hsh = {}
inv_comp = {}
inv_size = read_inv(0).to_i
inv_start = read_inv (1..inv_size)
inv_end = read_inv (-inv_size..-1)

inv_start.map! {|x| x.chomp}
inv_end.map! {|x| x.chomp}

inv_start.each do |x|
  inv_start_hsh.merge!(x.split[0] => x.split[1].to_i)
end

inv_end.each do |x|
  inv_end_hsh.merge!(x.split[0] => x.split[1].to_i)
end

inv_end_hsh.each_pair do |k, v|
  inv_comp.merge!(k => (v - inv_start_hsh[k]))
end


inv_comp.each_pair do |k, v|
  if v != 0
    puts k + " #{v > 0 ? "+#{v}" : v}"
  end
end