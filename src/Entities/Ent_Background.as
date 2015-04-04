package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_Background extends Entity 
	{
		[Embed(source = '../../art/backdrops/bg_OceanFloor.png')] private const OCEAN_BG:Class;

		
		
		private var backdrop:Image;
		
		public function Ent_Background() 
		{
			backdrop = new Image(OCEAN_BG);
			layer = 500;
			addGraphic(backdrop);
		}
		
	}

}