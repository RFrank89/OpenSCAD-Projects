echo(version=version());

// creditcard sizes
cc_x = 86; 	// width
cc_y = 58; 	// height
cc_z = 0.9; 	// thickness
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
		cube([93,68,11]);
		
		translate([-1,-1,-1])
		cube([7,7,13]); 			// corner
		
		translate([87,-1,-1])
		cube([7,7,13]);			// corner
		
		translate([-1, 62,-1])
		cube([7,7,13]);			// corner
		
		translate([87,62,-1])
		cube([7,7,13]);			// corner
		
		translate([38,8,-1])
		cube([25.4, 50, 5]);		// wemos raiser
				
		translate([38,57,-1])
		cube([15, 15, 5]);			// charger raiser
		
		translate([6,12,-1])
		cube([33, 48, 2]);			// e ink risaer
	}
	union()
	{
		translate([41,-2,2.5])
		cube([15,5,6]);				// button
		
		translate([38,67,4])
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
	
	
	difference()
	{	
		cube([95,70,2]);
		translate([5,21,-1])
		cube([28,28,4]);
	}
	
}

module cc_box()
{
	color("yellow")
	difference()
	{
		cube([95,70,18]);
		
		translate([-3,6,2])
		cc_cutout(cc_x+10,cc_y,cc_z*5); // x 1cm longer to have it stick out, z times 5 to simulate 5 cards	
		
		translate([105, 35, -3.5])
		pusher_cutout();
		translate([100, 35, -3.5])
		pusher_cutout();
		translate([95, 35, -3.5])
		pusher_cutout();
		
		translate([1,1,8])
		eink_screen_cutout();
	}
}


//translate([0,-400,0])
//eink_screen_cutout();
//
//translate([radius,-250,0])
//pusher_cutout();
//
//translate([cc_r, -100,0])
//creditcard();
//
//translate([0,-200,0])
//cc_cutout(cc_x,cc_y,cc_z);

translate([0,0,0])
cc_box();

translate([0,100,0])
cc_box_lid();