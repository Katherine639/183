#!/usr/bin/perl -n
#HW3_1.pl

BEGIN{

open($file, "+>>", "hourlyinfo")

}

(my $month, my $day, $time) = split(' ', $_);
(my $hour, my $min, my $second) = split(':',$time);

$rejects{$min}++ if /postfix.*reject/;
$quarantines{$min}++ if /amavis/;


END{

    for $k (sort keys %rejects){
    
	print $file "$month $day $hour:$k [postfix rejects:$rejects{$k}] [amavis quarantines:$quarantines{$k}]\n"
    
    }
    
}

##EXAMPLE OUTPUT
#Mar 1 hh:mm  [postfix rejects:27]  [amavis quarantines:30]
#Mar 1 hh:mm  [postfix rejects:17]  [amavis quarantines:33]

