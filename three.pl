#!/usr/bin/perl -n
#HW3_3

if($_ !~ /reject/){

    $from_addr{$1}++ if "$_" =~ /from=<([^\s]+)>/;
    $to_addr{$1}++ if "$_" =~/to=<([^\s]+)>/ ;
    
}

END{

    @froms = sort {$from_addr{$b} <=> $from_addr{$a} } keys %from_addr;
    
    for( $i = 0; $i < 5; $i++){
    
            print "From @froms[$i] $from_addr{$froms[$i]}\n";
   
   }
    
    @tos = sort {$to_addr{$b} <=> $to_addr{$a} } keys %to_addr;
    
    for( $j = 0; $j < 5; $j++){
    
        	print "To @tos[$j] $to_addr{$tos[$j]}\n";
    }

}
##EXAMPLE OUTPUT
#From bill@linux.org 42
#From snoopy@freethedogs.net 32 
#To bill@microsoft.com 21
