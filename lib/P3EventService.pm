package P3EventService;

use Dancer2;
use File::Spec;
use Data::Dumper;
use AnyEvent;
use AnyEvent::Util;

set 'session'      => 'Simple';
set 'template'     => 'template_toolkit';
set 'logger'       => 'console';
set 'log'          => 'debug';
set 'show_errors'  => 1;
set 'startup_info' => 1;
set 'warnings'     => 1;
# set 'layout'       => 'main';
set views    => File::Spec->rel2abs('./views');
set static_handler => 1;
set public_dir => "/home/olson/public_html/compare_regions";
set behind_proxy => 1;

our %channels;
our $next_name = "listener0000";

get '/listen/:channel' => sub {
    my $cname = route_parameters->get('channel');
    my $name = $next_name++;
    my $cv = AnyEvent->condvar;
    my $messages = [];
    my $entry = [$cv, $messages];
    $channels{$cname}->{$name} = $entry;
    my $guard = AnyEvent::Util::guard {
	print STDERR "removing stored cv for $cname $name\n";
	delete $channels{$cname}->{$name};
    };


    my $dsub;
    $dsub = sub {

	my($guard) = @_;
	print STDERR "channel $cname $name wakes $guard\n";

	while (defined(my $msg = shift @{$entry->[1]}))
	{
	    content "$msg\n";
	}
	
	$entry->[0] = AnyEvent->condvar;
	$entry->[0]->cb(delayed { &$dsub($guard); }
			on_error => sub { print "got error 1\n"; delete $channels{$cname}->{$name}}
			);
    };

    my $d = delayed {
	response_header 'Content-Type' => 'text/event-stream';
	flush;
	
	content "event: channel-start\ndata: $cname $name\n\n";
	$entry->[0]->cb(delayed { &$dsub($guard); }
			on_error => sub { print "got error 2\n"; delete $channels{$cname}->{$name} });
    }
    on_error => sub { print "got error 3 @_\n"; delete $channels{$cname}->{$name} };
    print "exit sub $d\n";
    return $d;
};

get '/notify/:channel' => sub {
    my $cname = route_parameters->get('channel');
    my $type = query_parameters->get('type');
    my $data = query_parameters->get('data');
    print Dumper(\%channels);
    my @dlines = split(/\n/, $data);
    my $pkt = join("\n", ((defined($type) ? "event: $type" : ()),
			  map { "data: $_" } @dlines)) . "\n";
    my $res = "";
    while (my($name, $entry) = each %{$channels{$cname}})
    {
	my($cv, $mlist) = @$entry;
	push @$mlist, $pkt;
	$cv->send();
	$res .= "$name\n";
    }
    "OK\n$res";
};

1;
