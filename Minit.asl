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
    settings.Add("split4tree", true, "Split after hiding tree resident?");
    settings.Add("splitcog", true, "Split after hit the cog?");
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
	if (current.isItemload != old.isItemload && current.isItemload == 1 || current.mapcode == 2)
	{
		return true;
	}
	if (settings["split4tree"] && current.reset != old.reset && current.mapcode == 52)
	{
		return true;
	}
	if (settings["splitcog"] && current.reset != old.reset && current.mapcode == 117)
	{
		return true;
	}
}

