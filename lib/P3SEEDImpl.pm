package P3SEEDImpl;
use strict;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

SEED

=head1 DESCRIPTION



=cut

#BEGIN_HEADER
use Data::Dumper;
use P3DataAPI;
use WebColors;
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR

#    $self->{api} = P3DataAPI->new('http://holly:3001');
    $self->{api} = P3DataAPI->new;
    
    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}
=head1 METHODS
=head2 compare_regions

  $return = $obj->compare_regions($opts)

=over 4




=item Description


=back

=cut

sub compare_regions
{
    my $self = shift;
    my($opts) = @_;

    my @_bad_arguments;
    (ref($opts) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"opts\" (value was \"$opts\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to compare_regions:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($return);
    #BEGIN compare_regions
    #END compare_regions
    my @_bad_returns;
    (ref($return) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to compare_regions:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($return);
}


=head2 compare_regions_for_peg

  $return = $obj->compare_regions_for_peg($peg, $width, $n_genomes, $coloring_method, $genome_filter)

=over 4




=item Description


=back

=cut

sub compare_regions_for_peg
{
    my $self = shift;
    my($peg, $width, $n_genomes, $coloring_method, $genome_filter) = @_;

    my @_bad_arguments;
    (!ref($peg)) or push(@_bad_arguments, "Invalid type for argument \"peg\" (value was \"$peg\")");
    (!ref($width)) or push(@_bad_arguments, "Invalid type for argument \"width\" (value was \"$width\")");
    (!ref($n_genomes)) or push(@_bad_arguments, "Invalid type for argument \"n_genomes\" (value was \"$n_genomes\")");
    (!ref($coloring_method)) or push(@_bad_arguments, "Invalid type for argument \"coloring_method\" (value was \"$coloring_method\")");
    (!ref($genome_filter)) or push(@_bad_arguments, "Invalid type for argument \"genome_filter\" (value was \"$genome_filter\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to compare_regions_for_peg:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($return);
    #BEGIN compare_regions_for_peg

    my $api = $self->{api};

    local $api->{token} = $ctx->token;
    print STDERR "Compare region using token $api->{token}\n";

    if ($self->{_new_service})
    {
	$return = $api->compare_regions_for_peg_new($peg, $width, $n_genomes, $coloring_method, $genome_filter);
    }
    else
    {
	$return = eval { $api->compare_regions_for_peg($peg, $width, $n_genomes, $coloring_method, $genome_filter); } ;
	
	if ($@)
	{
	    warn "Failed: $@\n";
	    die $@;
	}
    }
    #END compare_regions_for_peg
    my @_bad_returns;
    (ref($return) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to compare_regions_for_peg:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($return);
}


=head2 compare_regions_for_peg2

  $return = $obj->compare_regions_for_peg2($peg, $width, $n_genomes, $coloring_method, $genome_filter, $options)

=over 4




=item Description


=back

=cut

sub compare_regions_for_peg2
{
    my $self = shift;
    my($peg, $width, $n_genomes, $coloring_method, $genome_filter, $options) = @_;

    my @_bad_arguments;
    (!ref($peg)) or push(@_bad_arguments, "Invalid type for argument \"peg\" (value was \"$peg\")");
    (!ref($width)) or push(@_bad_arguments, "Invalid type for argument \"width\" (value was \"$width\")");
    (!ref($n_genomes)) or push(@_bad_arguments, "Invalid type for argument \"n_genomes\" (value was \"$n_genomes\")");
    (!ref($coloring_method)) or push(@_bad_arguments, "Invalid type for argument \"coloring_method\" (value was \"$coloring_method\")");
    (!ref($genome_filter)) or push(@_bad_arguments, "Invalid type for argument \"genome_filter\" (value was \"$genome_filter\")");
    (ref($options) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"options\" (value was \"$options\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to compare_regions_for_peg2:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($return);
    #BEGIN compare_regions_for_peg2

    my $api = $self->{api};

    local $api->{token} = $ctx->token;
    print STDERR "Compare region using token $api->{token}\n";

    if ($self->{_new_service})
    {
	$return = $api->compare_regions_for_peg_new($peg, $width, $n_genomes, $coloring_method, $genome_filter);
    }
    else
    {
	$return = eval { $api->compare_regions_for_peg($peg, $width, $n_genomes, $coloring_method, $genome_filter, $options);};
	if ($@)
	{
	    warn "Failed: $@\n";
	    die $@;
	}
    }

    #END compare_regions_for_peg2
    my @_bad_returns;
    (ref($return) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to compare_regions_for_peg2:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($return);
}


=head2 get_ncbi_cdd_url

  $url = $obj->get_ncbi_cdd_url($feature)

=over 4




=item Description


=back

=cut

sub get_ncbi_cdd_url
{
    my $self = shift;
    my($feature) = @_;

    my @_bad_arguments;
    (!ref($feature)) or push(@_bad_arguments, "Invalid type for argument \"feature\" (value was \"$feature\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_ncbi_cdd_url:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($url);
    #BEGIN get_ncbi_cdd_url
    #END get_ncbi_cdd_url
    my @_bad_returns;
    (!ref($url)) or push(@_bad_returns, "Invalid type for return variable \"url\" (value was \"$url\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_ncbi_cdd_url:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($url);
}


=head2 compute_cdd_for_row

  $cdds = $obj->compute_cdd_for_row($pegs)

=over 4




=item Description


=back

=cut

sub compute_cdd_for_row
{
    my $self = shift;
    my($pegs) = @_;

    my @_bad_arguments;
    (ref($pegs) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"pegs\" (value was \"$pegs\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to compute_cdd_for_row:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($cdds);
    #BEGIN compute_cdd_for_row
    #END compute_cdd_for_row
    my @_bad_returns;
    (ref($cdds) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"cdds\" (value was \"$cdds\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to compute_cdd_for_row:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($cdds);
}


=head2 compute_cdd_for_feature

  $cdds = $obj->compute_cdd_for_feature($feature)

=over 4




=item Description


=back

=cut

sub compute_cdd_for_feature
{
    my $self = shift;
    my($feature) = @_;

    my @_bad_arguments;
    (ref($feature) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"feature\" (value was \"$feature\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to compute_cdd_for_feature:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($cdds);
    #BEGIN compute_cdd_for_feature
    #END compute_cdd_for_feature
    my @_bad_returns;
    (ref($cdds) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"cdds\" (value was \"$cdds\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to compute_cdd_for_feature:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($cdds);
}


=head2 get_palette

  $colors = $obj->get_palette($palette_name)

=over 4




=item Description


=back

=cut

sub get_palette
{
    my $self = shift;
    my($palette_name) = @_;

    my @_bad_arguments;
    (!ref($palette_name)) or push(@_bad_arguments, "Invalid type for argument \"palette_name\" (value was \"$palette_name\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_palette:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($colors);
    #BEGIN get_palette

    if ($palette_name eq 'compare_region')
    {
	$colors = [@{WebColors::get_palette('special')}, @{WebColors::get_palette('many')}];
	splice(@$colors, 0, 3);

	#
	# Find red and promote it.
	#
	for my $i (0..$#$colors)
	{
	    my $c = $colors->[$i];
	    if ($c->[0] == 255 && $c->[1] == 0 && $c->[2] == 0)
	    {
		$colors->[$i] = $colors->[1];
		$colors->[1] = $c;
		last;
	    }
	}
		
    }
    else
    {
	$colors = WebColors::get_palette($palette_name);
	$colors = [] unless $colors;
    }

    #END get_palette
    my @_bad_returns;
    (ref($colors) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"colors\" (value was \"$colors\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_palette:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($colors);
}


=head2 get_function

  $functions = $obj->get_function($fids)

=over 4




=item Description


=back

=cut

sub get_function
{
    my $self = shift;
    my($fids) = @_;

    my @_bad_arguments;
    (ref($fids) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fids\" (value was \"$fids\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($functions);
    #BEGIN get_function
    #END get_function
    my @_bad_returns;
    (ref($functions) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"functions\" (value was \"$functions\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_function:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($functions);
}


=head2 assign_function

  $result = $obj->assign_function($functions, $user, $token)

=over 4




=item Description


=back

=cut

sub assign_function
{
    my $self = shift;
    my($functions, $user, $token) = @_;

    my @_bad_arguments;
    (ref($functions) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"functions\" (value was \"$functions\")");
    (!ref($user)) or push(@_bad_arguments, "Invalid type for argument \"user\" (value was \"$user\")");
    (!ref($token)) or push(@_bad_arguments, "Invalid type for argument \"token\" (value was \"$token\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to assign_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($result);
    #BEGIN assign_function
    #END assign_function
    my @_bad_returns;
    (ref($result) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"result\" (value was \"$result\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to assign_function:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($result);
}


=head2 get_location

  $locations = $obj->get_location($fids)

=over 4




=item Description


=back

=cut

sub get_location
{
    my $self = shift;
    my($fids) = @_;

    my @_bad_arguments;
    (ref($fids) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fids\" (value was \"$fids\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_location:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($locations);
    #BEGIN get_location
    #END get_location
    my @_bad_returns;
    (ref($locations) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"locations\" (value was \"$locations\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_location:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($locations);
}


=head2 get_translation

  $translations = $obj->get_translation($fids)

=over 4




=item Description


=back

=cut

sub get_translation
{
    my $self = shift;
    my($fids) = @_;

    my @_bad_arguments;
    (ref($fids) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fids\" (value was \"$fids\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_translation:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($translations);
    #BEGIN get_translation

    my $fidq = join(" OR ", map { "\"$_\"" } @$fids);
    my $sres = $self->{api}->solr_query("genome_feature",
			     { q => "patric_id:($fidq)",
			       fl => "patric_id,aa_sequence" });
    $translations = {};
    $translations->{$_->{patric_id}} = $_->{aa_sequence} foreach @$sres;

    #END get_translation
    my @_bad_returns;
    (ref($translations) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"translations\" (value was \"$translations\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_translation:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($translations);
}


=head2 get_dna_seq

  $seqs = $obj->get_dna_seq($fids)

=over 4




=item Description


=back

=cut

sub get_dna_seq
{
    my $self = shift;
    my($fids) = @_;

    my @_bad_arguments;
    (ref($fids) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fids\" (value was \"$fids\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_dna_seq:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($seqs);
    #BEGIN get_dna_seq

    my $fidq = join(" OR ", map { "\"$_\"" } @$fids);
    my $sres = $self->{api}->solr_query("genome_feature",
			     { q => "patric_id:($fidq)",
			       fl => "patric_id,na_sequence" });
    $seqs = {};
    $seqs->{$_->{patric_id}} = $_->{na_sequence} foreach @$sres;


    #END get_dna_seq
    my @_bad_returns;
    (ref($seqs) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"seqs\" (value was \"$seqs\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_dna_seq:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($seqs);
}


=head2 is_real_feature

  $results = $obj->is_real_feature($fids)

=over 4




=item Description


=back

=cut

sub is_real_feature
{
    my $self = shift;
    my($fids) = @_;

    my @_bad_arguments;
    (ref($fids) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fids\" (value was \"$fids\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to is_real_feature:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($results);
    #BEGIN is_real_feature
    #END is_real_feature
    my @_bad_returns;
    (ref($results) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"results\" (value was \"$results\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to is_real_feature:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($results);
}


=head2 get_genome_features

  $features = $obj->get_genome_features($genomes, $type)

=over 4




=item Description


=back

=cut

sub get_genome_features
{
    my $self = shift;
    my($genomes, $type) = @_;

    my @_bad_arguments;
    (ref($genomes) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"genomes\" (value was \"$genomes\")");
    (!ref($type)) or push(@_bad_arguments, "Invalid type for argument \"type\" (value was \"$type\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_genome_features:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($features);
    #BEGIN get_genome_features
    #END get_genome_features
    my @_bad_returns;
    (ref($features) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"features\" (value was \"$features\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_genome_features:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($features);
}


=head2 get_genomes

  $genomes = $obj->get_genomes()

=over 4




=item Description


=back

=cut

sub get_genomes
{
    my $self = shift;

    my $ctx = $P3SEEDService::CallContext;
    my($genomes);
    #BEGIN get_genomes
    #END get_genomes
    my @_bad_returns;
    (ref($genomes) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"genomes\" (value was \"$genomes\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_genomes:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($genomes);
}


=head2 all_subsystems

  $subsystem_names = $obj->all_subsystems()

=over 4




=item Description


=back

=cut

sub all_subsystems
{
    my $self = shift;

    my $ctx = $P3SEEDService::CallContext;
    my($subsystem_names);
    #BEGIN all_subsystems
    #END all_subsystems
    my @_bad_returns;
    (ref($subsystem_names) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"subsystem_names\" (value was \"$subsystem_names\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to all_subsystems:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($subsystem_names);
}


=head2 get_subsystem_roles

  $roles = $obj->get_subsystem_roles($subsystems)

=over 4




=item Description


=back

=cut

sub get_subsystem_roles
{
    my $self = shift;
    my($subsystems) = @_;

    my @_bad_arguments;
    (ref($subsystems) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"subsystems\" (value was \"$subsystems\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_subsystem_roles:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	die $msg;
    }

    my $ctx = $P3SEEDService::CallContext;
    my($roles);
    #BEGIN get_subsystem_roles
    #END get_subsystem_roles
    my @_bad_returns;
    (ref($roles) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"roles\" (value was \"$roles\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_subsystem_roles:\n" . join("", map { "\t$_\n" } @_bad_returns);
	die $msg;
    }
    return($roles);
}





=head2 version 

  $return = $obj->version()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module version. This is a Semantic Versioning number.

=back

=cut

sub version {
    return $VERSION;
}


1;
