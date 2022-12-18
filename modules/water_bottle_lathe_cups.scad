

module bottle_lathe_cap(end_diameter, cap_depth=14, label="",
    wall_thickness=4, bump_height=1, num_bumps=3, bump_bottom_offset=6,
    num_reference_bumps=4, reference_bump_depth=1,
    point_depth=8, point_angle=50, point_buried_depth=1,
    text_depth=1, font_size=5
) {
    opening_diameter = end_diameter+(bump_height*2);
    outside_diameter = opening_diameter+wall_thickness;
    bottom_thickness = max(wall_thickness,point_depth+point_buried_depth);
    difference() {
        union() {
            cylinder(h=cap_depth+bottom_thickness, d=outside_diameter, $fa=2, $fs=1);
        }
        // cup inside cutout
        translate([0,0,bottom_thickness+0.1])
        cylinder(h=cap_depth, d=opening_diameter, $fa=2, $fs=1);   
        // arbor point
        translate([0,0,-point_buried_depth])
        cylinder(d1=point_depth*tan(point_angle), d2=0, h=point_depth);
        // label
        #translate([0,0,bottom_thickness+0.1-text_depth+.01])
        linear_extrude(text_depth)
        text(label, font_size, halign="center", font="Arial");
        
        // reference bumps (outside)
        for(d = [0: (360/num_reference_bumps): 360-(360/num_reference_bumps)]) {
            rotate([0,0,d])
                translate([(end_diameter/2)-bump_height+wall_thickness,0,0])
                cylinder(h=cap_depth+bottom_thickness,r=reference_bump_depth, $fa=4, $fs=0.5);
            // label
            rotate([90,00,d+18])
                translate([(outside_diameter/2)-text_depth,bottom_thickness,0])
                rotate([0,90,0])
                linear_extrude(text_depth)                
          
                text(str(d), 8, halign="center", font="Arial");   
        }
        
    }    
    
    // edge bumps (inside)
    for(d = [0: (360/num_bumps): 360]) {
        rotate([0,0,d])
        translate([(end_diameter/2)+bump_height,0,bottom_thickness+bump_bottom_offset])
        cylinder(cap_depth-bump_bottom_offset,r=bump_height, $fa=4, $fs=0.5);
     
    }
}