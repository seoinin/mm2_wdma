package objects
{
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	
	public class Background extends Sprite
	{
		private var sky1:Sky1;
		private var sky2:Sky2;
		
		public function Background()
		{
			sky1 = new Sky1();
			addChild(sky1);
			
			sky2 = new  Sky2();
			sky2.y = -479;
			addChild(sky2);			
		}
		
		public function update():void
		{
			sky1.y += 2;
			if(sky1.y == 479)
				sky1.y = -479;
			sky2.y += 2;
			if(sky2.y == 479)
				sky2.y = -479;
		}
	public function removeFromParent()
		{
			var child:DisplayObject = this as DisplayObject;
			var parent:DisplayObjectContainer = child.parent;

			parent.removeChild(child);
		}
	}
}