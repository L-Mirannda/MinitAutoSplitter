state("minit")
{
    int reset : "minit.exe", 0x161898, 0x0;
    int isPaused : "minit.exe", 0x40761C, 0x0, 0x10, 0x4, 0x55C, 0xCC;
    int isDead : "minit.exe", 0x40761C, 0x0, 0x28, 0x1C, 0xCC;
    int isItemload : "minit.exe", 0x40761C, 0x0, 0x0, 0x4, 0x4BC, 0xCC;    
	int mapcode : "minit.exe", 0x617EA0;
}

startup
{
	settings.Add("items", true, "Item Splits");
	settings.Add("coins", true, "Coin Splits");
	settings.Add("hearts", true, "Heart Splits");
	settings.Add("misc", true, "Miscellaneous Splits");

	settings.CurrentDefaultParent = "items";
	settings.Add("sword", true, "Sword");
	settings.Add("wateringcan", true, "Watering Can");
	settings.Add("coffee", true, "Coffee");
	settings.Add("flashlight", true, "Flashlight");
	settings.Add("flippers", true, "Flippers");
	settings.Add("lighthousekey", true, "Lighthouse Key");
	settings.Add("swordthrower", true, "Sword Thrower");
	settings.Add("gardeningglove", true, "Gardening glove");
	settings.Add("boatwood", true, "Boatwood");
	settings.Add("camera", true, "Camera");
	settings.Add("basementkey", true, "Basement Key");
	settings.Add("megasword", true, "Mega Sword");
	settings.Add("brokensword", true, "Broken Sword");
	settings.Add("grinder", true, "Grinder");	

	settings.CurrentDefaultParent = "coins";
	settings.Add("hostel", true, "Hostel");
	settings.Add("bandits", true, "Bandits");
	settings.Add("truck", true, "Truck");


	settings.CurrentDefaultParent = "hearts";
	settings.Add("bull", true, "Bull");
	settings.Add("bird", true, "Bird");


	settings.CurrentDefaultParent = "misc";
	settings.Add("4tree", true, "Split after hiding tree resident");
	settings.Add("cog", true, "Split after hit the cog");
}


init
{
    Action resetVars = () =>
    {
	vars.reset = 0;
	vars.counter = 0;
    };
	vars.resetVars = resetVars;
    vars.resetVars();
}

update
{
	if (current.reset != old.reset)
    	{
        	vars.counter = vars.counter + 1;
	}		
}
 
start	
{
	return current.mapcode == 76;
}

split
{
	if (current.isItemload != old.isItemload && current.isItemload == 1)
	{
		if (current.mapcode == 91)
			return (settings["sword"]);
		if (current.mapcode == 16)
			return (settings["wateringcan"]);
		if (current.mapcode == 79)
			return (settings["coffee"]);
		if (current.mapcode == 90)
			return (settings["flashlight"]);
		if (current.mapcode == 48)
			return (settings["flippers"]);
		if (current.mapcode == 73)
			return (settings["lighthousekey"]);
		if (current.mapcode == 45)
			return (settings["swordthrower"]);
		if (current.mapcode == 17)
			return (settings["gardeningglove"]);
		if (current.mapcode == 71)
			return (settings["boatwood"]);
		if (current.mapcode == 68)
			return (settings["camera"]);
		if (current.mapcode == 101)
			return (settings["basementkey"]);
		if (current.mapcode == 117)
			return (settings["megasword"]);
		if (current.mapcode == 128)
			return (settings["brokensword"]);
		if (current.mapcode == 111)
			return (settings["grinder"]);

		if (current.mapcode == 46)
			return (settings["hostel"]);
		if (current.mapcode == 49)
			return (settings["bandits"]);
		if (current.mapcode == 125)
			return (settings["truck"]);

		if (current.mapcode == 11)
			return (settings["bull"]);
		if (current.mapcode == 51)
			return (settings["bird"]);
	}

	if (current.isDead != old.isDead && current.isDead == 1)
	{
		if (current.mapcode == 52)
			return (settings["4tree"]);
		if (current.mapcode == 117)
			return (settings["cog"]);
	}
	if (current.mapcode == 2)
			return true;
}


