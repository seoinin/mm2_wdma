package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Alien extends MovieClip {
		
		private var game:Game; 
		
		public function Alien(game:Game) {
			this.game = game;
			
			
		this.addEventListener(Event.ENTER_FRAME, moveMe);
			
			
		}
		
	public function die() {	
			this.removeEventListener(Event.ENTER_FRAME, moveMe);
			this.game.alienArray.splice(this.game.alienArray.indexOf(this) ,1) ;
				parent.removeChild(this);
				
		}
	
		
		
		
		private function moveMe(e:Event) {
			
			this.x +=5;
			
			if (this.x > 580 ) {
				this.x =-50;
			}
			
			
			
			

		}
		
		
		
		

        }
	}
	

