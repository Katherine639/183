#!/usr/bin/perl
#HW3_2

open($file,'<', "log2");

while (<$file>){

    if( "$_" =~ /\bconnect from (.*)\[(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\]/){
    
           	if($1 eq "unknown"){
  
	                 $unknown_cnt++;
	                 $unknown_ips{$2}++;
                   
      }
  
	  else{
  
	       $known_cnt++;
	       $known_ips{$2}++;
 	}
    }   
      }

@known = sort {$known_ips{$b} <=> $known_ips{$a} } keys %known_ips;
print "Total Known connection:".$known_cnt." - [$known[0]] accounts for $known_ips{$known[0]} connections\n";

@unknown = sort {$unknown_ips{$b} <=> $unknown_ips{$a} } keys %unknown_ips;
print "Total Unknown connection:".$unknown_cnt." - [$unknown[0]] accounts for $unknown_ips{$unknown[0]} connections\n";
