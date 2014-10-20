package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;	
	import flash.ui.Keyboard;
	
	
	public class Game extends MovieClip {

		private var hero:Hero; 
		private var background:Background; 
		
		public var alienArray:Array;
		public var missileArray:Array;
		public var score:int; 
		
	private var missile:Missile; 
		
		
		
		public function Game() {
			
			// Set locations for game assets

			missileArray = new Array();
			
			
			hero = new Hero();
			this.hero.x = 50;
			this.hero.y = 350;
			
			
			//Add game assets to stage

			this.addChild(this.hero);
			setupAliens();
			
			
			//add control 
			stage.addEventListener(KeyboardEvent.KEY_DOWN,handleKeystroke);
			stage.addEventListener( Event.ENTER_FRAME, handleCollision)

			
			
		}
		
		
		private function handleCollision (e:Event) {
			
			for (var i:int=0;i<alienArray.length;i++) {
				for (var j:int=0;j<missileArray.length;j++) {
				if (missileArray[j].hitTestObject(alienArray[i])) {
					trace ("hit against" + missileArray[j].name + "and" + alienArray[i].name);
					missileArray[j].die();
					alienArray[i].die();
				}
			}
		}
	}
		
		private function handleKeystroke (e:KeyboardEvent) {
			switch (e.keyCode) {
				case Keyboard.LEFT :
				this.hero.x-=8;
				break;

				case Keyboard.RIGHT :
				this.hero.x+=8;
				break;

				case Keyboard.UP :
				trace("Fire!");
				fireMissile();
				break;

			
			}
			
		}

		private function fireMissile() {
			missile = new Missile(this);
			
			missile.x = hero.x + 22;
			missile.y = hero.y;
			this.missileArray.push(missile);
			this.addChild(missile);
			
		}
		
		
		
		
		private function setupAliens() {
			alienArray = new Array();
			//alienGroup = new MovieClip();
			//this.addChild(alienGroup);
			
			
			for (var i:int=0;i<10;i++) {
				for (var j:int=0;j<4;j++) {
					var alienTemp:Alien = new Alien(this);
					alienTemp.x = 20+40*i;
					alienTemp.y = 20+40*j;
					alienArray.push(alienTemp);
					this.addChild(alienTemp);
				}
			}
		
			
			
		
		}
		
		
	}
	
}
