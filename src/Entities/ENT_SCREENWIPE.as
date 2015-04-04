package Entities 
{
		import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ENT_SCREENWIPE extends Entity 
	{
		[Embed(source = '../../art/Particles/bubble.png')] private const FISH1:Class;
				private var ParticleEmitter:Emitter;
		
		public function ENT_SCREENWIPE() 
		{
			y = 800;
			layer = -200000;
			graphic = (new Image(FISH1));
		}

	}

}