#!/usr/bin/perl
#HW3_4.pl


open($file, "<", "log4");

while(<$file>){

    $rejects++ if $_ =~ /(reject.*dnsbl.sorbs.net)/;

   	 if ($_ =~ /reject.*dnsbl.sorbs.net/){
    
	      $ips{$1}++ if $_ =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/;
  
    }
    
 		$from_addrs{$1}++ if $_ =~ /reject.*dnsbl.sorbs.net.*from=<([^\s]+)>/;

 		$to_addrs{$1}++ if $_ =~ /reject.*dnsbl.sorbs.net.*to=<([^\s]+)>/;

}


print "$rejects messages rejected\n";

$ip_cnt = keys %ips;
print "$ip_cnt unique IP's\n";
    
$from_cnt = keys %from_addrs;
print "$from_cnt from addresses\n";

$to_cnt = keys %to_addrs;
print "$to_cnt to addresses\n";

##EXAMPLE OUTPUT
#400 messages rejected
#23 unique IP’s 
#27 unique from addresses
#12 unique to address
