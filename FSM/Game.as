package 
{
	import interfaces.IState;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import states.Menu;
	import states.Play;
	import states.Instructions;
	import states.GameOver;
	
	public class Game extends Sprite
	{
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		public static const INSTRUCTIONS_STATE:int = 2;
		public static const GAME_OVER_STATE:int = 3;
		
		private var current_state:IState;
		
		public function Game()
		{
	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			changeState(MENU_STATE);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function changeState(state:int):void
		{
			if(current_state != null)
			{
				current_state.destroy();
				current_state = null;
			}
			
			switch(state)
			{
				case MENU_STATE:
					current_state = new Menu(this);
					break;
				
				case PLAY_STATE:
					current_state = new Play(this);
					break;
				
				case INSTRUCTIONS_STATE:
					current_state = new Instructions(this);
					break;
				
				case GAME_OVER_STATE:
					current_state = new GameOver(this);
					break;
			}
			
			addChild(Sprite(current_state));
		}
		
		private function update(event:Event):void
		{
			current_state.update();
		}
	}
}