package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import Game;
	
	
	public class Missile extends MovieClip {
		
		private var game:Game; 
		
		public function Missile(game:Game) {
			this.game = game;
		
		this.addEventListener(Event.ENTER_FRAME, moveMe);
			
			
		}
		
		private function moveMe(e:Event) {
			
			this.y -=5;
			
			if (this.y < 0 ) {
				die();
				
				
				
			}
	
	}
	
			public function die() {	
			this.removeEventListener(Event.ENTER_FRAME, moveMe);
				this.game.missileArray.splice(this.game.missileArray.indexOf(this) ,1) ;
				parent.removeChild(this);
				trace (this.game.missileArray.length);
		}
	
	
}
}
