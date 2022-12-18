include <modules/water_bottle_lathe_cups.scad>

swig_12oz_wine_cup();

module swig_12oz_wine_cup() {
    bottle_lathe_cap(89.5, 42, "Swig 12oz Wine Cup", font_size=7, bump_bottom_offset=25, num_bumps=6, bump_height=2);
}


