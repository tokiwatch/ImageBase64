# $Id$

package ImageBase64::ContextHandlers;

use strict;
use warnings;

#----- Tags
sub hdlr_tag {
    my ($ctx, $args) = @_;

    my $filepath = $args->{'filepath'};

    my $regex_jpg_s = qr|\.(jpe?g)$|;
    my $regex_png_s = qr|\.(png)$|;
    my $regex_gif_s = qr|\.(gif)$|;
    my $regex_bmp_s = qr|\.(bmp)$|;
    my $regex_jpg_l = qr|\.(JPE?G)$|;
    my $regex_png_l = qr|\.(PNG)$|;
    my $regex_gif_l = qr|\.(GIF)$|;
    my $regex_bmp_l = qr|\.(BMP)$|;

    my $mime_type;

    $mime_type = 'jpeg' if ($filepath =~ $regex_jpg_s);
    $mime_type = 'jpeg' if ($filepath =~ $regex_jpg_l);
    $mime_type = 'png'  if ($filepath =~ $regex_png_s);
    $mime_type = 'png'  if ($filepath =~ $regex_png_l);
    $mime_type = 'gif'  if ($filepath =~ $regex_gif_s);
    $mime_type = 'gif'  if ($filepath =~ $regex_gif_l);
    $mime_type = 'bmp'  if ($filepath =~ $regex_bmp_s);
    $mime_type = 'bmp'  if ($filepath =~ $regex_bmp_l);

    return if (! $mime_type);

    my $filesize = -s $filepath;
    my $bindata;

    {
        open my $infile, '<', $filepath;
        binmode $infile;
        read $infile, $bindata, $filesize;
        close $infile;
    }

    use MIME::Base64;
    my $out = encode_base64($bindata, '');


    $out;
}

1;
