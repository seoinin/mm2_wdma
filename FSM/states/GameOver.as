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
	
	public class GameOver extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
	
		
		public function GameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Background();
			addChild(background);

			var title = new Title();
			title.setTitle("Game Over");
			title.x= 200;
			title.y=15;
			addChild(title); 			
			
			var playButton:Button = new Button(); 
			addChild(playButton); 
			playButton.label = "Play"; 
			playButton.toggle =true;  
			playButton.move(50, 50);
			playButton.addEventListener(MouseEvent.CLICK, onPlay); 
			
			var menuButton:Button = new Button(); 
			addChild(menuButton); 
			menuButton.label = "Menu"; 
			menuButton.toggle =true;  
			menuButton.move(50, 150);
			menuButton.addEventListener(MouseEvent.CLICK, onMenu); 
		}

		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		private function onMenu(event:Event):void
		{
			game.changeState(Game.MENU_STATE);
		}
			
		
		private function onAgain(event:Event):void
		{
		
			game.changeState(Game.PLAY_STATE);
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