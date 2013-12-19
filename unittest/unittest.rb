File.open('unittest.txt','r').each_line do |f|
  a=f.split
  if a[0]=='0'
    if a[1].reverse==a[2] then puts 'Good test data' else puts 'Mismatch! Bad test data' end
  elsif a[0]=='1'
    if a[1].upcase==a[2] then puts 'Good test data' else puts 'Mismatch! Bad test data' end
  end
end