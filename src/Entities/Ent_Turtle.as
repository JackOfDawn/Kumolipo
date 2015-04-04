package Entities 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_Turtle extends ent_Placeable 
	{
		
		[Embed(source = '../../art/Creatures/sturgeon.png')] private const IMAGE:Class;
		
		public var sprFish:Spritemap;
		
		public function Ent_Turtle() 
		{
			//(ray, turtle, octopus)
			affectionArray = new Array( -4, 10, 0);
			cost = 2;
			
			sprFish = new Spritemap(IMAGE, 256, 128);
			
			sprFish.add("swim", [0, 1], 5, true);
			sprFish.add("idle", [0], 20, false);
			this.graphic = sprFish;
			
			this.setHitbox(256, 128);

			
		}
		
		
		override public function update():void
		{
			if (isSelected)
			{
				sprFish.play("idle");
			}
			else
			{
				sprFish.play("swim");
			}
			
			super.update();
		}
		
	}

}