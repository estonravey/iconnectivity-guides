#!/bin/bash
# Renames PlayAUDIO2D image files that have spaces in their names, and updates
# the image links in the guides to match. Run it from anywhere inside your
# iconnectivity-guides folder:   bash fix-image-names.sh
set -e
cd "$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "Run this inside your iconnectivity-guides folder."; exit 1; }
[ -d guides/playaudio2d/images ] || { echo "guides/playaudio2d/images not found - are you in the right folder?"; exit 1; }

moved=0; removed=0
move() { if [ -e "$1" ]; then git mv "$1" "$2"; echo "  renamed  ${1#guides/playaudio2d/}  ->  ${2##*/}"; moved=$((moved+1)); fi; }
remove_dup() { if [ -e "$1" ]; then git rm -q "$1"; echo "  removed duplicate  ${1#guides/playaudio2d/}"; removed=$((removed+1)); fi; }

echo "Renaming image files:"
move "guides/playaudio2d/images/02-output/05 dual tone dual master.png" "guides/playaudio2d/images/02-output/05-dual-tone-dual-master.png"
move "guides/playaudio2d/images/02-output/Dante Tx monitoring.png" "guides/playaudio2d/images/02-output/dante-tx-monitoring.png"
move "guides/playaudio2d/images/02-output/analog outputs live.png" "guides/playaudio2d/images/02-output/analog-outputs-live.png"
move "guides/playaudio2d/images/02-output/analog single edit.png" "guides/playaudio2d/images/02-output/analog-single-edit.png"
move "guides/playaudio2d/images/02-output/dante tx 32 monitoring.png" "guides/playaudio2d/images/02-output/dante-tx-32-monitoring.png"
move "guides/playaudio2d/images/02-output/dante tx detail.png" "guides/playaudio2d/images/02-output/dante-tx-detail.png"
move "guides/playaudio2d/images/03-midi/midi monitor.png" "guides/playaudio2d/images/03-midi/midi-monitor.png"
move "guides/playaudio2d/images/05-safemode/03 check exceed .png" "guides/playaudio2d/images/05-safemode/03-check-exceed.png"
move "guides/playaudio2d/images/05-safemode/04 check enable.png" "guides/playaudio2d/images/05-safemode/04-check-enable.png"
move "guides/playaudio2d/images/05-safemode/safemode 01.png" "guides/playaudio2d/images/05-safemode/safemode-01.png"
move "guides/playaudio2d/images/06-midi-processing/01 midi proecssing port rules.png" "guides/playaudio2d/images/06-midi-processing/01-midi-proecssing-port-rules.png"
move "guides/playaudio2d/images/06-midi-processing/02 midi processing device rulesa.png" "guides/playaudio2d/images/06-midi-processing/02-midi-processing-device-rulesa.png"
remove_dup "guides/playaudio2d/images/dante-controller/dc-routing-pa2d rx.png"
remove_dup "guides/playaudio2d/images/dante-controller/dc-routing-pa2u tx.png"
echo "  $moved renamed, $removed duplicates removed"

echo "Updating image links:"
MAP=$(mktemp)
cat > "$MAP" <<'MAPEOF'
images/00-scene/audio 00 dual master audio input.png	images/00-scene/00-dual-master.png
images/00-scene/audio 00 start.png	images/00-scene/00-start.png
images/00-scene/audio 02 digital outputs.png	images/00-scene/02-digital-outputs.png
images/00-scene/audio 02.1 digital outputs enc.png	images/00-scene/02.1-digital-outputs-enc.png
images/00-scene/audio 03 analog inputs.png	images/00-scene/03-analog-inputs.png
images/00-scene/audio 03.1 analog inputs enc.png	images/00-scene/03.1-analog-inputs-enc.png
images/00-scene/audio 04 dante rx.png	images/00-scene/04-dante-rx.png
images/00-scene/audio 04.1 dante rx enc.png	images/00-scene/04.1-dante-rx-enc.png
images/00-scene/audio 05 tone.png	images/00-scene/05-tone.png
images/00-scene/audio 05.1 tone A enc.png	images/00-scene/05.1-tone-a-enc.png
images/00-scene/audio 05.1 tone B enc.png	images/00-scene/05.1-tone-b-enc.png
images/01-input/00 analog inputs.png	images/01-input/analog-inputs.png
images/01-input/00.1 analog inputs some mute.png	images/01-input/analog-inputs-some-mute.png
images/01-input/00.1.2 analog inputs all edits.png	images/01-input/analog-inputs-all-edits.png
images/01-input/analog input edit single.png	images/01-input/analog-input-edit-single.png
images/01-input/dante rx 1 ch.png	images/01-input/dante-rx-1-ch.png
images/01-input/dante rx all.png	images/01-input/dante-rx-all.png
images/01-input/dante rx live meters.png	images/01-input/dante-rx-live-meters.png
images/02 Output/Dante Tx monitoring.png	images/02-output/dante-tx-monitoring.png
images/02 Output/analog outputs live.png	images/02-output/analog-outputs-live.png
images/02 Output/analog single edit.png	images/02-output/analog-single-edit.png
images/02 Output/dante tx 32 monitoring.png	images/02-output/dante-tx-32-monitoring.png
images/02 Output/dante tx detail.png	images/02-output/dante-tx-detail.png
images/02-output/05 dual tone dual master.png	images/02-output/05-dual-tone-dual-master.png
images/02-output/Dante Tx monitoring.png	images/02-output/dante-tx-monitoring.png
images/02-output/analog outputs live.png	images/02-output/analog-outputs-live.png
images/02-output/analog single edit.png	images/02-output/analog-single-edit.png
images/02-output/dante tx 32 monitoring.png	images/02-output/dante-tx-32-monitoring.png
images/02-output/dante tx detail.png	images/02-output/dante-tx-detail.png
images/03 midi/midi monitor.png	images/03-midi/midi-monitor.png
images/03-midi/midi monitor.png	images/03-midi/midi-monitor.png
images/04 system/system.png	images/04-system/system.png
images/05 safemode/02.png	images/05-safemode/02.png
images/05 safemode/03 check exceed .png	images/05-safemode/03-check-exceed.png
images/05 safemode/04 check enable.png	images/05-safemode/04-check-enable.png
images/05 safemode/safemode 01.png	images/05-safemode/safemode-01.png
images/05-safemode/03 check exceed .png	images/05-safemode/03-check-exceed.png
images/05-safemode/04 check enable.png	images/05-safemode/04-check-enable.png
images/05-safemode/safemode 01.png	images/05-safemode/safemode-01.png
images/06-midi-processing/01 midi proecssing port rules.png	images/06-midi-processing/01-midi-proecssing-port-rules.png
images/06-midi-processing/02 midi processing device rulesa.png	images/06-midi-processing/02-midi-processing-device-rulesa.png
images/auracle-x/00 audio.main.png	images/auracle-x/00-audio.main.png
images/auracle-x/01 audio.dante.png	images/auracle-x/01-audio.dante.png
images/auracle-x/02 audio.headphones.png	images/auracle-x/02-audio.headphones.png
images/auracle-x/mute global mute.png	images/auracle-x/mute-global-mute.png
images/dante-controller/dc-routing-pa2d rx.png	images/dante-controller/dc-routing-pa2d-rx.png
images/dante-controller/dc-routing-pa2u tx.png	images/dante-controller/dc-routing-pa2u-tx.png
MAPEOF
for md in guides/playaudio2d/*.md; do
  perl -i -e '
    open(M, "<", $ARGV[0]) or die; my %map;
    while (<M>) { chomp; my ($o,$n) = split /\t/; $map{$o} = $n; }
    close M; shift @ARGV; my $count = 0;
    while (<>) {
      s{(!\[[^\]]*\]\()([^)\s]+)(\))}{
        my ($a,$p,$z) = ($1,$2,$3); (my $d = $p) =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
        if (exists $map{$d}) { $count++; "$a$map{$d}$z" } else { "$a$p$z" }
      }ge;
      print;
    }
    print STDERR "  $count links updated in $ARGV\n" if $count;
  ' "$MAP" "$md"
done
rm -f "$MAP"

echo "Checking image links:"
for md in guides/playaudio2d/*.md; do
  dir=$(dirname "$md")
  perl -ne '
    BEGIN { $dir = shift @ARGV; }
    while (/!\[[^\]]*\]\(([^)\s]+)\)/g) {
      my $p = $1; next if $p =~ m{^https?://}; (my $d = $p) =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
      $total++; unless (-e "$dir/$d") { $bad++; print "    missing: $p\n"; }
    }
    END { printf "  %s: %d images, %d missing\n", $ARGV, $total, $bad; }
  ' "$dir" "$md"
done
echo
echo "Done. Review the changes in VS Code (Source Control), then commit and push."
