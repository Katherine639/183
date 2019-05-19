#!/usr/bin/perl
#HW3_5

open($in, "<", @ARGV[0]);

exit(0) if $#ARGV <= 1;

while($line = <$in>){

    $found = 0; #false
       for $num (1...$#ARGV) {
    
      	if($line =~ /(@ARGV[$num])/){
        
	             $found = 1; #true;
	}
    }
    if(!$found){
    
       	push @outstream, $line;
    }
}

close($in);

if($#outstream){

    open($out_file, ">", @ARGV[0]);
    print $out_file @outstream;
    
}



##EXECUTION COMMAND
#./five.pl logfile reject bill@microsoft.com dnsbl
