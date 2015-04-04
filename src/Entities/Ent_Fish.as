package Entities 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_Fish extends ent_Placeable 
	{
		[Embed(source = '../../art/FPO/FPO_Plant.png')] private const FISH_IMAGE:Class;
		
		public function Ent_Fish() 
		{
			this.graphic = new Image(FISH_IMAGE);
			this.setHitbox(128, 64);
		}
	}
}