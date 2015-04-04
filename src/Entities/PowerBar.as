package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class PowerBar extends Entity
	{
		[Embed (source = '../../art/HUD/Powerbar_frame.png')] private const POW_FRAM:Class;
		[Embed (source = '../../art/HUD/Powerbar_mana.png')] private const POW_MANA:Class;
		
		
		private var barFrame:Image;
		private var barPower:Image;
		private var MAXPOW:int;
		
		private var xx:int;
		private var displayList:Graphiclist;
		public function PowerBar(MAXPOWe:int) 
		{
			layer = -700;
			
			barFrame = new Image(POW_FRAM);
			barPower = new Image(POW_MANA);
			
			barFrame.x = 636;
			barFrame.y = 630;
			
			barPower.x = xx = 651;
			barPower.y = 650;
			
			MAXPOW = MAXPOWe;
			
			displayList = new Graphiclist(barFrame, barPower);
			
			addGraphic(displayList);
			
			//updateBar(22);
		}
		
		
		public function updateBar(currPOw:int):void
		{
			barPower.scaleX = currPOw / MAXPOW;
			barPower.x = xx + (barPower.width - barPower.scaledWidth);
			//trace(barPower.scaledWidth, barPower.width);
		}
		
	}

}