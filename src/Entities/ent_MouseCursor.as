package Entities 
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class ent_MouseCursor extends Entity 
	{
		[Embed(source = '../../art/HUD/cursor1.png')] private const MOUSE_CURSOR:Class;
		[Embed(source = '../../art/HUD/cursor2.png')] private const MOUSE_CURSOR2:Class;
		
		
		private var upSelect:Image;
		private var downSelect:Image;
		
		public function ent_MouseCursor() 
		{
			upSelect = new Image(MOUSE_CURSOR);
			downSelect = new Image(MOUSE_CURSOR2);
			layer = -10000;
			super();
		}
		
		
		override public function update():void
		{
			this.x = Input.mouseX;
			this.y = Input.mouseY;
			
			if (Input.mouseDown)
			{
				this.graphic = downSelect;
			}
			else
				this.graphic = upSelect;
			//FP.log(" X = " + this.x + " Y = " + this.y);
		}
	}

}