package orp.model.events
{
	import flash.events.Event;
	
	public class TaskEvent extends Event
	{
		public static var ADDED:String = 'TaskEvent.ADDED';
		
		public function TaskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new TaskEvent(type, bubbles, cancelable);
		}
	}
}