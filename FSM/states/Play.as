package states
{
	import Game;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import fl.controls.Button;
	import objects.Background;	
	import objects.Title;
	import interfaces.IState;
	
	public class Play extends Sprite implements IState
	{
		public var game:Game;
		private var background:Background;
		
		
		public function Play(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);

			var title = new Title();
			title.setTitle("Play");
			title.x= 200;
			title.y=15;
			addChild(title); 			
						
			var gameOverButton:Button = new Button(); 
			addChild(gameOverButton); 
			gameOverButton.label = "Game Over"; 
			gameOverButton.toggle =true;  
			gameOverButton.move(50, 50);
			gameOverButton.addEventListener(MouseEvent.CLICK, onGameOver); 
			
			var menuButton:Button = new Button(); 
			addChild(menuButton); 
			menuButton.label = "Menu"; 
			menuButton.toggle =true;  
			menuButton.move(50, 150);
			menuButton.addEventListener(MouseEvent.CLICK, onMenu); 
		}
		
		private function onGameOver(event:Event):void
		{
			game.changeState(Game.GAME_OVER_STATE);
		}
		
		private function onMenu(event:Event):void
		{
			game.changeState(Game.MENU_STATE);
		}
		public function update():void
		{
			background.update();
			
		}
		
		public function destroy():void
		{
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