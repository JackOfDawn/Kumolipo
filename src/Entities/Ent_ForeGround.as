package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_ForeGround extends Entity 
	{
		[Embed(source = '../../art/backdrops/bg_OceanWalls.png')] private const OCEAN_WALL:Class;
		
		
		private var foredrop:Image;
		public function Ent_ForeGround() 
		{
			foredrop = new Image(OCEAN_WALL);
			layer = 300;
			addGraphic(foredrop);
		}
		
	}

}