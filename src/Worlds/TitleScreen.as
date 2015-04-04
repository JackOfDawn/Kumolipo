package Worlds 
{
	import Entities.ent_MouseCursor;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class TitleScreen extends World 
	{
		[Embed(source = '../../art/Backdrops/title.png')] private const TITLE:Class;
		[Embed(source = '../../art/Backdrops/titlepage_button_light.png')] private const BUTTON:Class;
		private var button:Image;
		public function TitleScreen() 
		{
			button = new Image(BUTTON);
			addGraphic(new Image(TITLE));
			button.x = 347;
			button.y = 550;
			addGraphic(button);
			
			add(new ent_MouseCursor());
		}
		
		
		override public function update():void
		{
			if (Input.mouseDown == true)
			{
				FP.world = new wrld_OceanFloor();
			}
			
			super.update();
		}
	}

}