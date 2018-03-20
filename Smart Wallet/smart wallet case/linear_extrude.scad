echo(version=version());

// creditcard sizes
cc_x = 86; 	// width
cc_y = 54; 	// height
cc_z = 0.8; 	// thickness
cc_r = 3.18; 	// rounded corner radius
cc_h = 0.8; 	// rounded corner thickness

// pusher cutout sizes
radius = 20;
height = 10;

// global settings
$fn=500;

module creditcard()
{
	color("red")  
	minkowski()
	{
		cube([cc_x - (2 * cc_r), cc_y - (2 *cc_r), cc_z/2]);
		cylinder(r = cc_r, h = cc_z/2, center = true);
	}
}

module eink_screen_cutout()
{
	color("brown")
	difference()
	{
		cube([103,78.5,11]);
		
		translate([-1,-1,-4])
		cube([11,11,11]); 			// corner
		
		translate([93,-1,-4])
		cube([11,11,11]);			// corner
		
		translate([-1, 68.5,-4])
		cube([11,11,11]);			// corner
		
		translate([93,68.5,-4])
		cube([11,11,11]);			// corner
		
		translate([48,20,-1])
		cube([25.4, 50, 5]);		// wemos
				
		translate([48,67.5,-1])
		cube([15, 12, 5]);			// charger raiser
		
		translate([10,19,-1])
		cube([33, 48, 5]);			// e ink
	}
	union()
	{
		translate([19,77.5,2.5])
		cube([15,5,6]);				// button
		
		translate([48,77.5,4])
		cube([15,6,8]);				// charger hole
	}
}

module cc_cutout(x,y,z)
{
	color("blue")
	cube([x, y, z]);
}

module pusher_cutout()
{	
	color("green")
	cylinder(r=radius,h=height);
}

module cc_box_lid()
{
	color("white")
	cube([105,80,2]);
}

module cc_box()
{
	color("yellow")
	difference()
	{
		cube([105,80,18]);
		
		translate([2,13,2])
		cc_cutout(cc_x+50,cc_y,cc_z*5); // x 1cm longer to have it stick out, z times 5 to simulate 5 cards	
		
		translate([0, 40, -1])
		pusher_cutout();
		translate([5, 40, -4])
		pusher_cutout();
		translate([10, 40, -4])
		pusher_cutout();
		
		translate([1,0.75,8])
		eink_screen_cutout();
	}
}




translate([0,-400,0])
eink_screen_cutout();

translate([radius,-250,0])
pusher_cutout();

translate([cc_r, -100,0])
creditcard();

translate([0,-200,0])
cc_cutout(cc_x,cc_y,cc_z);

translate([0,0,0])
cc_box();

translate([0,100,0])
cc_box_lid();