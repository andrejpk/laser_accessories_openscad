include <modules/water_bottle_lathe_cups.scad>

rtic_20oz_bottle();

module rtic_20oz_bottle() {
    bottle_lathe_cap(72.5, 15, "RTIC 20oz Bottle", font_size=7, bump_bottom_offset=9);
}
