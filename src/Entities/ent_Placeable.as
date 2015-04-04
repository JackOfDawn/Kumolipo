package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import CONSTANTS;	
	/**
	 * ...
	 * @author ...
	 */
	public class ent_Placeable extends Entity
	{
		protected var affectionArray:Array;
		protected var isSelected:Boolean;
		protected var dead:Boolean;
		public var cost:int;
		
		public function ent_Placeable() 
		{
			dead = false;
			layer = -502;
		}
		
		
		override public function update():void
		{
		
			if (isSelected) 
			{	
				handleSelected();
			}
			else if(checkRemoval())
			{
				FP.world.remove(this);
			}
			super.update();
		}
		
		private function handleSelected():void
		{

			this.x = Input.mouseX - this.halfWidth;
			this.y = Input.mouseY - this.halfHeight;
		
		}
		
		private function checkRemoval():Boolean
		{
			if (this.x + width < 0 || this.x + width > 840 ||
				this.y + height < 0 || this.y + height > 580)
				{
					dead = true;
					return true;
				}
			return false;
				
		}
		
		public function setSelection(selected:Boolean):void
		{
			isSelected = selected;
		}
		
		public function isDead():Boolean
		{
			return dead;
		}
		
		public function getEffects():Array
		{
			return affectionArray;
		}
		
	}

}