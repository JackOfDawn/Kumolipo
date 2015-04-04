package Entities 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_MenuEagleRay extends Ent_MenuItem
	{
		[Embed(source = '../../art/HUD/Ray_Icon.PNG')] private const MENUICON:Class;
		
		public function Ent_MenuEagleRay() 
		{
			graphic = new Image(MENUICON);
			setHitbox(128,128);
			super(CONSTANTS.EAGLERAY);
		}
	}
		
}