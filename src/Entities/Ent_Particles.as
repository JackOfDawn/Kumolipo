package Entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;
	
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ent_Particles extends Entity 
	{
		[Embed(source = '../../art/Particles/fish_1.png')] private const FISH1:Class;
		[Embed(source = '../../art/Particles/fish_2.png')] private const FISH2:Class;
		
		[Embed(source = '../../art/Particles/bubs.png')] private const bub:Class;
		
		private var ParticleEmitter:Emitter;
		public function Ent_Particles() 
		{
			
			layer = 400;
			
			//fish
			ParticleEmitter = new Emitter(FISH1, 32, 32);
			ParticleEmitter.newType("fish1", [0]);
			ParticleEmitter.setMotion("fish1", 175, 1000, 7, 10, -100, 1);
			
			//other fish
			ParticleEmitter.setSource(FISH2, 64, 64);
			ParticleEmitter.newType("fish2", [0]);
			ParticleEmitter.setMotion("fish2", -5, 1000, 7, 10, -100, 1);
			
			//bubbles
			ParticleEmitter.setSource(bub, 25, 21);
			
			ParticleEmitter.newType("bub", [0]);
			ParticleEmitter.setMotion("bub", 92, 1000, 7, -5, -100, 1, Ease.sineIn);
			ParticleEmitter.setAlpha("bub", .5, .5);
			
			
			graphic = ParticleEmitter;
		}
		
		public function makeFishOnRight():void
		{
			ParticleEmitter.emit("fish1", Math.random() * 200 + 800, Math.random() * 500);
			ParticleEmitter.emit("fish1", Math.random() * 200 + 800 , Math.random() * 500);
			//ParticleEmitter.emit("fish1", Math.random() * 200 + 800, Math.random() * 500);
		}
		
		public function makeFishOnLeft():void
		{
			
			ParticleEmitter.emit("fish2",  Math.random() * 200 - 200 , Math.random() * 500);
			
		}
		
		
		public function makeBubbles():void
		{
			var makeBub:int = Math.random() * 2;
			
			if (makeBub == 0)
			{
				ParticleEmitter.emit("bub", Math.random() * 30 + 33, 483);
			}
			else
			{
				ParticleEmitter.emit("bub", Math.random() * 30 + 748, 483);
			}
		}
		
	}

}