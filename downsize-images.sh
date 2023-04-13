#! /usr/bin/env nix-shell
#! nix-shell -i bash -p imagemagick jpeg-archive

###
# About
###
#
# This is a helper script to (semi-)automatically reduce the size of images
# by downsizing them to a width of 1920px and then using jpeg-recompress
# to find the optimal jpeg quality and imagemagick to create webp and avif
# versions of the image.
#
# For example, the 3.8M Haj.jpg has been converted to a 404K JPG, 328K WebP
# and 108K AVIF files.
#
# For onw, the actual inclusion of these images will be handled by nginx,
# based on the browsers advertised capabilities.
#
###
# Usage
###
#
#   ./downsize-images.sh <source-image> [output-path]
#
# The output-path defaults to content/images/ and will always be suffixed
# with the name (Filename without extension) of the source-image.
#
###
# Requirements
###
#
# You need to have imagemagick and jpeg-recompress installed or alternatively
# have the nix package manager installed locally which will automatically
# pull these dependencies.

width=1920
formats=( "avif" "webp" "jpg" )
source_image=${1:?Please specify the source image}
out=${2:-content/images/}

filename="${source_image##*/}"
image_name="${filename%%.*}"
original_size=$(du -bs $source_image | cut -f -1 )
original_width=$(convert $source_image -format "%w" info:)

if [[ $width -gt $original_width ]]; then
  printf "Image has a width %upx smaller than %upx. Using smaller size.\n" $original_width $width
  width=$original_width
fi

printf "%s is %'.0f bytes in size\n" $source_image $original_size
mkdir -p $out$image_name

size_convert="-resize ${width}x "
out_name_base="$out$image_name/$image_name-$width"
for format in "${formats[@]}"; do
  outName="$out_name_base.${format}"
  out_convert=""
  if [[ $format == "webp" ]]; then
    out_convert="$out_convert"
  fi
  out_convert="$out_convert $outName"
  convert="convert $source_image $size_convert $out_convert"
  #echo $convert
  $convert
  if [[ $format == "jpg" ]]; then
    jpeg_rc="jpeg-recompress --quiet $outName $outName"
    #echo $jpeg_rc
    $jpeg_rc
  fi
  outSize=$(du -b $outName | cut -f -1)
  pct="$(( 10**6 * (outSize * 100) / original_size ))e-6"
  printf "Resulting size for %s is %'.0f bytes (%.2f%% of original size)\n" ${outName##*/} $outSize $pct
done
for format in "${formats[@]}"; do
  base_image="$out_name_base.${format}"
  if [ ! -f $base_image ]; then
    printf "%s Does not exist...\n" $base_image
    continue
  fi
  base_size=$(du -b $base_image | cut -f -1)
  comparisons=()
  case $format in
    "jpg")
      # This is our fallback format. It's expected that this won't be
      # the smalles. So no comparisons at all
      continue
      ;;
    "webp")
      # Since webp has ~95% browser compatibility (compared to 81% for AVIF)
      # we still want to keep the WebP version even if it's larger than
      # AVIF. But if it's larger than JPG, there is no point in keeping it.
      comparisons=( "jpg" )
      ;;
    "avif")
      comparisons=( "jpg" "webp" )
      ;;
  esac
  for format_comp in "${comparisons[@]}"; do
    comparison_image="$out_name_base.${format_comp}"
    comparison_size=$(du -b $comparison_image | cut -f -1)
    if [[ $base_size -gt $comparison_size ]]; then
      pct_diff="$(( 10**6 * (base_size - comparison_size) * 100 / comparison_size ))e-6"
      #echo "$base_image in $format is larger ($base_size bytes) than $comparison_image in $format_comp format ($comparison_size bytes)."
      printf "%s is %.2f%% larger than %s\n" ${base_image##*/} $pct_diff ${comparison_image##*/}
      echo "Dropping $base_image..."
      rm $base_image
      break
    fi
  done
done
