package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class ent_Plant extends Entity 
	{
		[Embed(source = '../../art/FPO/FPO_Plant.png')] private const PLANT_GRAPHIC:Class;
		public function ent_Plant() 
		{
			this.graphic = new Image(PLANT_GRAPHIC);
			super();
			
		}
		
		override public function update():void
		{
	
			
			
		}
		
	}

}