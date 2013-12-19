awk '
{
  if ($1==1) {
    if ($3==toupper($2)) {
      print "Good test data\n"
    } else {
      print "Mismatch! Bad test data\n"
    }
  } else if ($1==0) {
    for(i=length;i!=0;i--)x=x substr($2,i,1);
    if ($3==x) {
      print "Good! test data\n"
    } else {
      print "Mismatch! Bad test data\n"
    }
    x=""
  }
}
'