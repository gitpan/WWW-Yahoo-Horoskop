package WWW::Yahoo::Horoskop;
use strict;
#use warnings;
use Exporter;
our @ISA = qw/Exporter/;
our @EXPORT = qw/horoskop/;
our $VERSION = '0.1';
use LWP::Simple;
use LWP::UserAgent;

sub horoskop {
	my $zwei = shift || 'widder';
	my $erst = shift || 'tag';
	my $text;

	if($erst eq "woche"){
		my $url = get("http://de.lifestyle.yahoo.com/sterne/wochenhoroskop-$zwei.html");
		($text) = ($url =~ /(<p><b>Gesundheit\/Fitness<\/b>.+?)"Lust"-Partner:/s);
		$text =~ s/<(.+?)>//g;
		$text =~ s/[\n\r]//g;
		$text =~ s/&nbsp;Beruf\/Geld\s*/\n\nBeruf\/Geld\n/g;
		$text =~ s/Gesundheit\/Fitness\s*/Gesundheit\/Fitness\n/g;
		$text =~ s/&nbsp;Liebe\/Partnerschaft\s*/\n\nLiebe\/Partnerschaft\n/g;
	}else{
		my $url = get("http://de.lifestyle.yahoo.com/sterne/horoskop-$zwei.html");
		($text) = ($url =~ /height=12 width=12 alt=stern>([^><]*)<!-- daily horoscope daily \d+ -->/s);
		$text =~ s/[\n\r]//g;
	}
	$text =~ s/ä/ae/g;
	$text =~ s/ü/ue/g;
	$text =~ s/ö/oe/g;
	$text =~ s/Ä/Ae/g;
	$text =~ s/Ü/Ue/g;
	$text =~ s/Ö/Oe/g;
	$text =~ s/ß/ss/g;
	return($text);
}


=pod

=head1 NAME

WWW::Yahoo::Horoskop - Perl module for the yahoo horoskop german service.

=head1 SYNOPSIS

	use WWW::Yahoo::Horoskop;
	# day horoskop
	my($newhoroskop) = horoskop('widder','tag');

	# or week horoskop
	my($newhoroskop) = horoskop('widder','woche');

	# The twelve zodiac signs
	#
	# example: english - german (date)
	#
	# wassermann: Aquarius – Wassermann(21. Januar – 19. Februar)
	# fische: Pisces – Fische (20. Februar – 20. März)
	# widder: Aries – Widder (21. März – 20. April)
	# stier: Taurus – Stier(21. April – 20. Mai)
	# zwilling: Gemini – Zwillinge (21. Mai – 21. Juni)
	# krebs: Cancer – Krebs (22. Juni – 22. Juli)
	# loewe: Leo – Löwe (23. Juli – 23. August)
	# jungfrau: Virgo– Jungfrau (24. August – 23. September)
	# waage: Libra – Waage (24. September – 23. Oktober)
	# skorpion: Scorpio – Skorpion (24. Oktober – 22. November)
	# schuetze: Sagittarius – Schütze (23. November – 21. Dezember)
	# steinbock: Capricorn – Steinbock (22. Dezember – 20. Januar)


=head1 DESCRIPTION

WWW::Yahoo::Horoskop - Perl module for the yahoo horoskop german service.

=head1 AUTHOR

    Stefan Gipper <stefanos@cpan.org>, http://www.coder-world.de/

=head1 COPYRIGHT

	WWW::Yahoo::Horoskop is Copyright (c) 2010 Stefan Gipper
	All rights reserved.

	This program is free software; you can redistribute
	it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO



=cut
