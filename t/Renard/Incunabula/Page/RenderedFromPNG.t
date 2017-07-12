#!/usr/bin/env perl

use Test::Most tests => 1;

use lib 't/lib';
use Renard::Incunabula::Devel::TestHelper;

use Renard::Incunabula::Common::Setup;
use Renard::Incunabula::Page::RenderedFromPNG;

subtest "Process arguments for PDF file" => sub {
	my $png_path = try {
		Renard::Incunabula::Devel::TestHelper->test_data_directory->child(qw(PNG libpng ccwn3p08.png));
	} catch {
		plan skip_all => "$_";
	};

	my $page_model = Renard::Incunabula::Page::RenderedFromPNG->new(
		png_data => $png_path->slurp_raw
	);

	isa_ok $page_model->cairo_image_surface, 'Cairo::ImageSurface';
	is $page_model->width, 32;
	is $page_model->height, 32;
};
