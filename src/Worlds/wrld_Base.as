package Worlds 
{
	import Entities.ent_MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import Entities.BarIcon;
	
	
	
	
	
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class wrld_Base extends World 
	{
		
		
		protected var creatureArray:Array;
		protected var selectableArray:Array;
		protected var itemIsSelected:Boolean;
		protected var numCreatureTypes:int;
		protected var worldStats:Array;
		protected var WORLD_POWER_MAX:int;
		protected var currentWorldPower:int;
		
		protected const X_BOUND:int = 860;
		protected const Y_BOUND:int = 600;
		
		protected var BarIcons:Array;
		
	
		
		public function wrld_Base(numTypes:int) 
		{
			numCreatureTypes = numTypes;
			worldStats = new Array();
			for (var i:int = 0; i < numTypes; i++) 
			{
				worldStats.push(0);
			}
			
			BarIcons = new Array(new BarIcon(869, 384, 1), new BarIcon(919, 384, 2), new BarIcon(970, 384, 3));
		}
		
		public function initCursor():void
		{
			add(new ent_MouseCursor());
			
			for (var i:int = 0; i < BarIcons.length; i++) 
			{
				add(BarIcons[i]);
			}
		}
		
		public function UpdateIcons():void
		{
			var BarLevels:Array = new Array(0, 0, 0);
			var StatRank:int;
			for (var i:int = 0; i < worldStats.length; i++) 
			{
				StatRank = worldStats[i] % 6;
				
				if (worldStats[i] < 3)
					StatRank = 3;
				
				switch(StatRank)
				{
					case 0:
						BarLevels[i] = 0;
						break;
					case 1:
					case 5:
						BarLevels[i] = 1;
						break;
					case 2:
					case 4:
						BarLevels[i] = 2;
						break;
						
					default:
						BarLevels[i] = 3;
						break;
				}
				
				FP.log(worldStats);
			}
			
			
			
			for (var j:int = 0; j < BarIcons.length; j++) 
			{
				//BarIcons[j].moveTowards(BarIcons[j].x, getLevel(BarLevels[j], worldStats[j]), 10);
				var stat:int = -worldStats[j];
				BarIcons[j].moveTowards(BarIcons[j].x, ( stat * 7.5) + 480, 5 ) ;
				//BarIcons[j].y = ( stat * 23) + 500);
				//BarIcons[j].y = ( -worldStats[j] * 23) + 500;
				if (BarIcons[j].y > 480) BarIcons[j].y = 480;
				else if (BarIcons[j].y < 200) BarIcons[j].y = 200;
				
			}
			//trace(BarIcons[0].y);
		}
		
		
		
		
		
	}

}