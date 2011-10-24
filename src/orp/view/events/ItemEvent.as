package orp.view.events
{
	import flash.events.Event;
	
	import orp.vo.Task;
	
	public class ItemEvent extends Event
	{
		public static const SHOW_DATA:String = 'ItemEvent.SHOW_DATA';
		
		private var _task:Task;
		
		public function ItemEvent(type:String, task:Task = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_task = task;
		}
		
		override public function clone():Event
		{
			return new ItemEvent(type, task, bubbles, cancelable);
		}
		
		public function get task():Task
		{
			return _task;
		}
	}
}