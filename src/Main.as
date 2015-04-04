package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import Worlds.*;
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(1024, 768);
			FP.world = new TitleScreen();
			//FP.console.enable();
			Mouse.hide();
			FP.frameRate = 30;
		}
		
		override public function init():void 
		{
		}
		
	}
	
}