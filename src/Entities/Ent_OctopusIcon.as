package Entities 
{
		import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_OctopusIcon extends Ent_MenuItem 
	{
		[Embed(source = '../../art/HUD/Octo_Icon.PNG')] private const MENUICON:Class;
		public function Ent_OctopusIcon() 
		{
			graphic = new Image(MENUICON);
			setHitbox(128, 128);
			super(CONSTANTS.OCTOPUS);
		}
		
		
		public function updateTest():void
		{
			this.moveTowards(0,100,1);
			//super.update();
		}
		
	}

}