package Entities 
{
	import net.flashpunk.Entity;
	import CONSTANTS;	
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_MenuItem extends Entity 
	{
		private var TYPE:String;
		public function Ent_MenuItem(type:String) 
		{
			TYPE = type;
			layer = -501
		}
		
		public function getType():String
		{
			return TYPE;
			
		}
	}

}