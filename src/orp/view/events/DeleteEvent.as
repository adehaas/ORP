package orp.view.events
{
	import flash.events.Event;
	
	import orp.vo.Task;
	
	public class DeleteEvent extends Event
	{
		public static const DELETE:String = 'DeleteEvent.DELETE';
		
		private var _task:Task;
		
		public function DeleteEvent(task:Task)
		{
			super(DELETE);
			
			_task = task;
		}
		
		override public function clone():Event
		{
			return new DeleteEvent(task);
		}
		
		public function get task():Task
		{
			return _task;
		}
	}
}