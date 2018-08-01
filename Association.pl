#!/usr/bin/env perl
use v5.18;

#ITEM List
my @ITEM = qw/APPLE BANANA CERRY  BEAR EGG FINEAPPLE GOLD_LABEL IceCream MILK ORENGE PlayStation XBOX MEAT FORK/;

#make Random data && Data sort
my @T1 = @ITEM[3..7,11,2]; @T1 = sort @T1; push @T1,$#T1;
my @T2 = @ITEM[1 ..9]; @T2 = sort @T2; push @T2,$#T2;
my @T3 = @ITEM[3..4,11,7]; @T3 = sort @T3; push @T3,$#T3;
my @T4 = @ITEM[3,7,11,2]; @T4 = sort @T4; push @T4, $#T4;
my @T5 = @ITEM[3..5,1,2]; @T5 = sort @T5; push @T5, $#T5;
my @T6 = @ITEM[6..8,-5,-1]; @T6 = sort @T6; push @T6, $#T6;
my @T7 = @ITEM[5..9,1,-5]; @T7 = sort @T7; push @T7, $#T7;

# Array set is all data sets
my @set = (\@T1, \@T2, \@T3, \@T4, \@T5, \@T6, \@T7);

my @ret;
my $array = 7;
my $cnt = 0;
my $index = 0;
while($cnt <= $#set){
	$index = 0;
	while($index <= $set[$cnt][-1]){
		$index++;
	}
	$cnt++;
}

my $list_cnt = 0;
my $flag = 0;
my $set_index = 0;
my @set_value;
foreach my $it (@ITEM){
	my @test_v;
	$list_cnt = 0;
	my @tmp;
	while(1){
		last if($list_cnt > $array+1);
		my ($i, $j); $flag = 0;
		while($i != $set[$list_cnt][-1]){
			if ($set[$list_cnt][$i] eq $it){
				$flag = 1; last;}
			$i ++;
		}
		while($flag){
			last if($j > $set[$list_cnt][-1]);
			unless($it eq $set[$list_cnt][$j]){
				push  @tmp ,$set[$list_cnt][$j];
			}
			$j++;
		}
		@tmp = sort(@tmp);
		$list_cnt++;
	}
	if($tmp[0]){
		push @tmp, $#tmp+1;
	 	@test_v = make_hash(@tmp);
		my $test_c = 0;
		foreach(@test_v){
			if($test_v[$test_c]){
			print "$it => $ITEM[$test_c] :: $test_v[$test_c]/$array \n";
			$test_c++;	
			}
		}
		say;
	}
	$set_index++;
}

sub make_hash(){
	my @sub_t = @_;
	my @value;
	my $cnt;
	foreach (@sub_t){
		while($cnt <= $#ITEM){
			if($_ =~ $ITEM[$cnt]){$value[$cnt]++; $cnt = 0; last;}
			else{$value[$cnt] += 0; $cnt++}
		}
	}
	return @value;
}
