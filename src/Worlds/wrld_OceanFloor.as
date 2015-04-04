package Worlds 
{
	import Entities.*;
	import flash.display.Graphics;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	import CONSTANTS;	
	
	/**
	 * ...
	 * @author Jack Storm
	 */
	public class wrld_OceanFloor extends wrld_Base 
	{
		[Embed(source = '../../art/Backdrops/bg_OceanFloor.png')] private const BG_OCEANFLOOR:Class;
		//[Embed(source = '../../art/Backdrops/bg_OceanFloor.png')] private const BG_OCEAN:Class;
		
		
		private var HUD:Ent_HUD
		
		private var Particles:Ent_Particles;
		private var WIPE:ENT_SCREENWIPE;
		
		private var DONE:Boolean;
		
		
		private var timerFish1:Number;
		private var timerFish2:Number;
		
		
		private var timerWipe:Number;
		
		private var GODS:ent_tiki;
		
		private var pBar:PowerBar;
		
		public function wrld_OceanFloor() 
		{
			super(3);
			
			DONE = false;
			add(new Ent_Background());
			add(new Ent_ForeGround());
			add(Particles = new Ent_Particles());
			add(WIPE = new ENT_SCREENWIPE());
			add(HUD = new Ent_HUD());
			add(GODS = new ent_tiki());
			
			
			
			
			selectableArray = new Array( new Ent_OctopusIcon(),  new Ent_MenuTurtle(),new Ent_MenuEagleRay() );
			creatureArray = new Array();
			itemIsSelected = false;
			
			for (var i:int = 0; i < selectableArray.length; i++) 
			{
				add(selectableArray[i])
				selectableArray[i].x = i * 175 + 50;
				selectableArray[i].y = 600;
			}
			timerFish1 = 0;
			timerFish2 = 1;
			
			WORLD_POWER_MAX = 22;
			currentWorldPower = WORLD_POWER_MAX;
			
			add(pBar = new PowerBar(WORLD_POWER_MAX));
			
			initCursor();
		}
		
		override public function update():void
		{
			if (DONE && !itemIsSelected)
			{
				timerWipe += FP.elapsed;
				WIPE.moveTowards(0, -30, 10);
				if(timerWipe >= 5)
					FP.world = new TitleScreen();
			}
			else
			{
				if (Input.mouseDown)
				{
					checkForSelection();
					
				}
				else
				{
					clearSelection();
				}
				
				calculateStats();
				
				updateResources();
				HUD.updateResources(currentWorldPower, WORLD_POWER_MAX);
				UpdateIcons();
				
				
				checkEndState();
				
				//Draw particles
				timerFish1 += FP.elapsed;
				if (timerFish1 >= 3)
				{
					Particles.makeFishOnRight();
					timerFish1 -= 3;
				}
				
				timerFish2 += FP.elapsed;
				if (timerFish2 >= 3)
				{
					Particles.makeFishOnLeft();
					Particles.makeBubbles();
					timerFish2 -= 3;
				}
				
				pBar.updateBar(currentWorldPower);
				
			}
			super.update();
		}
		
		private function checkEndState():void
		{
			
			var stat:int;
			for (var i:int = 0; i < worldStats.length; i++) 
			{
				
				stat = worldStats[i] % 20;
				
				if (stat == 0 && worldStats[i] != 0)
				{
					DONE = true;
				}
				else
				{
					DONE = false;
					timerWipe = 0;
					
					break;
				}
			}
			//if(success && !itemIsSelected)
			//	FP.world = new Wrld_Level2();
		}
		
		private function checkForSelection():void
		{
			var powerLeft:Boolean = true;
			if (!itemIsSelected)
			{
				for (var i:int = 0; i < selectableArray.length; i++) 
				{
					if (Input.mouseX > selectableArray[i].x && Input.mouseX < selectableArray[i].x + selectableArray[i].width &&
						Input.mouseY > selectableArray[i].y && Input.mouseY < selectableArray[i].y + selectableArray[i].height)
						{
							if (selectableArray[i].getType() == CONSTANTS.EAGLERAY && currentWorldPower - 4 >= 0)
							{
								creatureArray.push(new Ent_MantaRay());
								creatureArray[creatureArray.length - 1].setSelection(true);
								add(creatureArray[creatureArray.length - 1]);
								itemIsSelected = true;
							}
							if (selectableArray[i].getType() == CONSTANTS.TURTLE && currentWorldPower - 2 >= 0)
							{
								creatureArray.push(new Ent_Turtle());
								creatureArray[creatureArray.length - 1].setSelection(true);
								add(creatureArray[creatureArray.length - 1]);
								itemIsSelected = true;
							}
								
							if (selectableArray[i].getType() == CONSTANTS.OCTOPUS && currentWorldPower - 4 >= 0)
							{
								creatureArray.push(new Ent_Octopus());
								creatureArray[creatureArray.length - 1].setSelection(true);
								add(creatureArray[creatureArray.length - 1]);
								itemIsSelected = true;
							}	
							
							break;

						}
				}
			}
				
			if (!itemIsSelected)
			{
				for (var j:int = creatureArray.length - 1; j >= 0 ; j--) 
				{
					if (Input.mouseX > creatureArray[j].x && Input.mouseX < creatureArray[j].x + creatureArray[j].width &&
						Input.mouseY > creatureArray[j].y && Input.mouseY < creatureArray[j].y + creatureArray[j].height)
						{
							creatureArray[j].setSelection(true);
							itemIsSelected = true;
							break;
						}
				}
			}
		}
		
		private function calculateStats():void
		{
			var distance:Number;
			var effect:Number;
			var value:Number;
			
			
	
			resfreshStats(); // zero the world stats
			calcBaseStats(); // add unchanges base stats
			calcDistanceAffect();
			
			
			/*
			for (var i:int = 0; i < numCreatureTypes; i++) // go through each of the worlds stats
			{
				worldStats[i] = 0;
				
				for (var j:int = 0; j < creatureArray.length; j++) 
				{
					if (creatureArray[j].x + creatureArray[j].width < X_BOUND && creatureArray[j].y + creatureArray[j].height < Y_BOUND)
					{
						value = creatureArray[j].getEffects()[i];
						for (var k:int = 0; k < creatureArray.length; k++) 
						{
							distance = FP.distance(creatureArray[j].centerX, creatureArray[j].centerY, creatureArray[k].centerX,  creatureArray[k].centerY);
							//trace(distance);
							if (distance < (2 * creatureArray[j].width) && distance > (creatureArray[j].halfWidth) && k != j &&
								creatureArray[k].x + creatureArray[k].width < X_BOUND && creatureArray[k].y + creatureArray[k].height < Y_BOUND
								&& creatureArray[j].getEffects()[i] != 0)
							{
								effect = creatureArray[j].getEffects()[i];
								//(Affect of A on B * A width) / (4 * distance)
								value += (effect * creatureArray[j].width) / (10 * distance);
							}			
						}
						worldStats[i] += value;
					}
				}
			}
			
			*/
			
			//trace(worldStats[0] + " " + worldStats[1] + " " + worldStats[2]);
		}
		
		private function resfreshStats():void
		{
					//refresh world stats
			for (var i:int = 0; i < worldStats.length; i++) 
			{
				worldStats[i] = 0;
			}
		}
		
		private function calcBaseStats():void
		{
				//calculate base world stats
			for (var i:int = 0; i < worldStats.length; i++) 
			{
				for (var k:int = 0; k < creatureArray.length; k++) 
				{
					if(checkBounds(creatureArray[k]))
						worldStats[i] += creatureArray[k].getEffects()[i];
				}
			}
		}
		
		private function calcDistanceAffect():void
		{
			var distance:Number;
			var effect:Number;
			var value:Number;
			
			for (var i:int = 0; i < worldStats.length; i++) 
			{
				for (var j:int = 0; j < creatureArray.length; j++) 
				{	
					if (checkBounds(creatureArray[j]))
					{
						for (var k:int = 0; k < creatureArray.length; k++) 
						{
							 if (checkBounds(creatureArray[k]))
							 {
								 if (creatureArray[j].getEffects()[i] < 0 && creatureArray[k].getEffects()[i] > 0)
								 {
									 //trace(creatureArray[j] + " : " + creatureArray[k])
									 distance = FP.distance(creatureArray[j].x, creatureArray[j].y, creatureArray[k].x, creatureArray[k].y);
									 
									 if (distance < 2 * creatureArray[j].width)
									 {
										effect = creatureArray[j].getEffects()[i];
										
										//(Affect of A on B * A width) / (4 * distance)
										worldStats[i] += (effect * creatureArray[j].width) / (6 * distance);
									 }
								 }
							 }
						}
					}
				}
			}
		}
		
		private function checkBounds(unit:ent_Placeable):Boolean
		{
			return (unit.x + unit.width < X_BOUND && unit.y + unit.height < Y_BOUND);
		}
		
		
		public function updateResources():void
		{
			currentWorldPower = WORLD_POWER_MAX;
			for (var i:int = 0; i < creatureArray.length ; i++) 
			{
				currentWorldPower -= creatureArray[i].cost;
			}
			
			
		}
		private function clearSelection():void
		{
			for (var i:int = 0; i < creatureArray.length; i++) 
			{
				creatureArray[i].setSelection(false);
				itemIsSelected = false;
				if (creatureArray[i].isDead())
				{
					creatureArray.splice(i,1);
					i--;
				}
			}
		}
	}

}