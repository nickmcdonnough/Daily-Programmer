# 
# Solution to Challenge #136 [Easy]
# http://redd.it/1kphtf
# 

awk -F " " '
{
	for(i = 2; i <= NF; i++) x += $i;
	avg = x / (i - 2);
	print $1":", avg;
	grades[$1] = avg;
	x = 0;
}
END {
	for(i in grades) {
		n++;
		y += grades[i];
	}
	printf "Class average: %.2f\n", y/n;
}
'