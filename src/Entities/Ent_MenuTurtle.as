package Entities 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_MenuTurtle extends Ent_MenuItem 
	{
		[Embed(source = '../../art/HUD/Turt_Icon.png')] private const MENUICON:Class;
		public function Ent_MenuTurtle() 
		{
			graphic = new Image(MENUICON);
			setHitbox(128, 128);
			super(CONSTANTS.TURTLE);
		}
		
	}

}