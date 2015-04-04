package Entities 
{
		import net.flashpunk.graphics.Image;
		import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_Octopus extends ent_Placeable 
	{
		[Embed(source = '../../art/Creatures/octopus.png')] private const IMAGE:Class;
		
		public var sprFish:Spritemap;
		
		public function Ent_Octopus() 
		{
			//(ray, turtle, octopus)
			affectionArray = new Array( 0, -4, 13);
			cost = 4;
			
			
			sprFish = new Spritemap(IMAGE, 138, 93);
			
			sprFish.add("swim", [0, 1],1, true);
			sprFish.add("idle", [0], 20, false);
			this.graphic = sprFish;
			this.setHitbox(138, 91);
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
}//138
//91