package Entities 
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author ...
	 */
	public class ent_tiki extends Entity
	{
		[Embed(source = '../../art/HUD/tiki.png')] private const IMAGE:Class;
		
		public var sprFish:Spritemap;
		public function ent_tiki() 
		{
			
			sprFish = new Spritemap(IMAGE, 150, 150);
			sprFish.add("swim", [0, 1], 5, true);
			
			sprFish.play("swim");
			this.x = 854;
			this.y = 33;
			layer = -600;
			this.graphic = sprFish;
		}
		
	}

}