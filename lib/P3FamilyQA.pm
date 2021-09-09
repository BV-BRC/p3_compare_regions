package P3FamilyQA;

use Dancer2;
use File::Spec;
use Template;
use P3DataAPI;
use Data::Dumper;

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

my $flash;

sub set_flash {
    my $message = shift;
    
    $flash = $message;
}

sub get_flash {
    
    my $msg = $flash;
    $flash = "";
    
    return $msg;
}

hook before_template_render => sub {
    my $tokens = shift;

    $tokens->{root_url} = request->base;
    $tokens->{'css_url'} = request->base . 'css/style.css';
};

get '/' => sub {
    template 'index.tt', {
	'msg' => get_flash(),
	'search_url' => uri_for('/search'),
    };
};

post '/search' => sub {
    my $qry = body_parameters->get('query');
    # my $qry = param('query');
    my $api = P3DataAPI->new();

    my $res;
    if ($qry eq '')
    {
	$res = [];
    }
    else
    {
	$res = $api->search_families($qry);
    }
    
    template 'search_results.tt', {
	query => $qry,
	results => $res,
	family_url => uri_for('/family'),
    };
};

get '/family/:family' => sub {
    my $fam = route_parameters->get("family");
    my $api = P3DataAPI->new();
    my $funh = $api->family_function([$fam]);
    my $fun = $funh->{$fam};
    print Dumper($fun, $funh, $fam);
    my $members = $api->members_of_family_mysql($fam);

    template 'family.tt', {
	family_function => $fun,
	family_id => $fam,
	members => $members,
	compare_regions_url => uri_for('/compare_regions'),
    };
};

get '/compare_regions/:fid' => sub {
    my $fid = route_parameters->get('fid');
    my $shade = query_parameters->get("shade_fids");
    my $channel = query_parameters->get('channel');
    my @event_url;
    @event_url = (event_url => uri_for('/events/listen/' . $channel)) if defined($channel);

    template 'compare_regions.tt', {
	feature_id => $fid,
	service_url => uri_for('/api'),
	($shade ? (shade_fids => $shade) : ()),
	@event_url,
    };
};

1;
