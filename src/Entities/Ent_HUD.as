package Entities 
{
	import flash.display.Sprite;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_HUD extends Entity
	{
		//Frames
		[Embed(source = '../../art/HUD/Frame_v.png')] private const HUD_FRAME_SIDE:Class;
		[Embed(source = '../../art/HUD/Frame_h.png')] private const HUD_FRAME_BOTTOM:Class;
		[Embed(source = '../../art/HUD/Box1.png')] private const HUD_BOTTOM:Class;
		[Embed(source = '../../art/HUD/Box2.png')] private const HUD_SIDE:Class;
		[Embed(source = '../../art/HUD/balance_bar.png')] private const HUD_BAR:Class;
		[Embed(source = '../../art/FONT/ARIAL.TTF', embedAsCFF = "false", fontFamily = 'My Font')] 
		private const FONT:Class;
		
		
		//Barslevels
	
		
		
		private var display:Graphiclist;
		
		//frames
		private var hudBottom:Image;
		private var hudSide:Image;
		private var hudFrameSide:Image;
		private var hudFrameBottom:Image;
		
		//bars
		private var bar1:Image;
		private var bar2:Image;
		private var bar3:Image;
		
		private var text:Text;
		
		private var barHeight:int = 300;
		
		public function Ent_HUD() 
		{
			Text.font = "My Font";
			hudBottom = new Image(HUD_BOTTOM);
			hudBottom.y = 596;
			layer = -500
			hudSide = new Image(HUD_SIDE);
			hudSide.y = 20;
			hudSide.x = 837;
			
			hudFrameBottom = new Image(HUD_FRAME_BOTTOM);
			hudFrameBottom.y = 565;
			hudFrameBottom.x = -25;
			
			hudFrameSide = new Image(HUD_FRAME_SIDE);
			hudFrameSide.y = -15
			hudFrameSide.x = 815;
			
			
			//BarIcons = new Array(new BarIcon(HUD_BARICON_RAY, 869, 384), new BarIcon(HUD_BARICON_TURTLE, 919, 384), new BarIcon(HUD_BARICON_OCTO, 919, 384));
			
			bar1 = new Image(HUD_BAR);
			bar1.x = 870;
			bar1.y = 200;
			
			bar2 = new Image(HUD_BAR);
			bar2.x = 920;
			bar2.y = 200;
			
			
			bar3 = new Image(HUD_BAR);
			bar3.x = 970;
			bar3.y = 200;
			
			//this.moveTowards(xval, yval, aount)
			
			text = new Text(" / ");
			text.x = 800;
			text.y = 650;
			
			
			display = new Graphiclist(hudSide, hudBottom , hudFrameSide, hudFrameBottom, bar1, bar2, bar3, text);
			addGraphic(display);

			
		}
		
		
		public function updateResources(resource:int, MAX:int):void
		{
			text.text = resource + " / " + MAX;
		}
		
	}

}