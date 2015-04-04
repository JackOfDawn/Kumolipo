package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class BarIcon extends Entity 
	{
		[Embed(source = '../../art/HUD/rayheadshotsmall.PNG')] private const HUD_BARICON_RAY:Class;
		[Embed(source = '../../art/HUD/turtleheadshotsmall.PNG')] private const HUD_BARICON_TURTLE:Class;
		[Embed(source = '../../art/HUD/octopusheadshotsmall.PNG')] private const HUD_BARICON_OCTO:Class;
		public function BarIcon(xx:int, yy:int, selection:int) 
		{
			layer = -510
			
			switch(selection)
			{
				case 1:
					graphic = new Image(HUD_BARICON_RAY);
					break;
				case 2:
					graphic = new Image(HUD_BARICON_TURTLE);
					break;
				case 3:
					graphic = new Image(HUD_BARICON_OCTO);
					break;
			}
			x = xx;
			y = yy;
			
		}
		
	}

}