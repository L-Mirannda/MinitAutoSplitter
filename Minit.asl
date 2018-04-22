state("minit")
{
    int reset : "minit.exe", 0x161898, 0x0;
    int isPaused : "minit.exe", 0x40761C, 0x0, 0x10, 0x4, 0x55C, 0xCC;
    int isDead : "minit.exe", 0x40761C, 0x0, 0x28, 0x1C, 0xCC;
    int isItemload : "minit.exe", 0x40761C, 0x0, 0x0, 0x4, 0x4BC, 0xCC;
	int mapcode : "minit.exe", 0x617EA0;
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
    return (current.isItemload != old.isItemload && current.isItemload == 0 || current.mapcode == 2);
}
