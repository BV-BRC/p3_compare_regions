use P3SEEDImpl;

#use P3EventService;
use P3SEEDService;
use Plack::Middleware::CrossOrigin;
use P3FamilyQA;
use Plack::Builder;
use Data::Dumper;
use FIG_Config;

$FIG_Config::p3_data_api_url = "http://cherry.mcs.anl.gov:3001";
#$FIG_Config::p3_data_api_url = "https://p3.theseed.org/services/data_api";

my @dispatch;

{
    my $obj = P3SEEDImpl->new;
    push(@dispatch, 'SEED' => $obj);
}

my $server = P3SEEDService->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );


my $handler = sub { print STDERR Dumper(\@_); $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");

$handler;
