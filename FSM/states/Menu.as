package states
{
	import Game;
	
	import interfaces.IState;
	
	import objects.Background;
	import objects.Title;
	
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import fl.controls.Button;
	
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
	    private var title:Title;
		
		
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);
			
			var title = new Title();
			title.setTitle("Main Menu");
			title.x= 200;
			title.y=15;
			
			addChild(title); 
			
			var playButton:Button = new Button(); 
			addChild(playButton); 
			playButton.label = "Play"; 
			playButton.toggle =true;  
			playButton.move(50, 50);
			playButton.addEventListener(MouseEvent.CLICK, onPlay); 
			
			var instructionsButton:Button = new Button(); 
			addChild(instructionsButton); 
			instructionsButton.label = "Instructions"; 
			instructionsButton.toggle =true;  
			instructionsButton.move(50, 150);
			instructionsButton.addEventListener(MouseEvent.CLICK, onInstructions); 
	
			
			
	
		}
		
		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		private function onInstructions(event:Event):void
		{
			game.changeState(Game.INSTRUCTIONS_STATE);
		}
		
		public function update():void
		{
			background.update();
		}
		
		public function destroy():void
		{
			background.removeFromParent();
			background = null;
			
			removeFromParent();
		}
		
		private function removeFromParent()
		{
			var child:DisplayObject = this as DisplayObject;
			var parent:DisplayObjectContainer = child.parent;

			parent.removeChild(child);
		}
	}
}