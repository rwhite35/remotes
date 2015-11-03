#!/usr/bin/perl
use strict;
use warnings;

# simple Perl script for test different data structures.
# version 1.0, 2015-10-20
# Another comment
#
# all elements in an indexed array are scalar values
# when defining data objects scalar, array or hash, must use package 
my @array = (12,13,14);
my $c = $array[0] + $array[2];
print "The value of array[0] and array[2] is ", $c, "\n";

my @list = qw/a b c d e f g/; # define an array list
my %hash=();  # empty hash

foreach my $key (@list) {
  $hash{$key} = $key;
}

print join(" ", sort keys %hash),"\n";

# all element in a hash are also scalar values
# note the use of curly brace in stead of square brace
my %contact=('first_name'=>'Ron','last_name'=>'White');
print keys %contact, "\n" ;
print "my name is ", $contact{"first_name"}, "\n";

# references ponts to the memory allocation for each data objects on the memory heap.  
# We can use a reference to refer to data objects and their elements.
# use '\' before data object name when asigning a pointer to a scalar var
my $aref = \@array;
print "Reference pointer to my array ", $aref, "\n";

# now that we have a reference to the array, we can 
# get individual elements.
print "Here is array[1] value ", $aref->[1], "\n";

# same reference rules apply for hash
my $href = \%contact;
print "Reference pointer to my hash ", $href->{"last_name"}, "\n";

# using arrays and references, we can have arrays within arrays
my @arr1 = ("red","blue","green");
my $arr1ref = \@arr1;
my @arr2 = ("purple","pink","yellow",$arr1ref);

foreach my $element (@arr2){
   if(ref($element) eq 'ARRAY'){ # if we find a reference to a data object
    my @derefArr = @{$element}; # instance a new array by de-referencing the reference
    foreach my $subelem (@derefArr) { # now we can iterate over the sub array
	    print $subelem, "\n";
    }   
   }else{
	print $element, "\n";
   }
}
