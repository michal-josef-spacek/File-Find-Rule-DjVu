use strict;
use warnings;

use File::Find::Rule::DjVu;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my @ret = File::Find::Rule->djvu_chunk('INFO')->relative->in($data_dir->s);
is_deeply(
	\@ret,
	['chunk_INFO.djvu'],
	'Get DjVu files with INFO chunk in data directory.',
);
