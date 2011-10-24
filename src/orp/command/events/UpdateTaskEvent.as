package orp.command.events
{
	import flash.events.Event;
	
	import orp.vo.Task;
	
	public class UpdateTaskEvent extends Event
	{
		public static const UPDATE:String = 'UpdateTaskEvent.UPDATE';
		
		private var _task:Task;
		
		public function UpdateTaskEvent(task:Task)
		{
			super(UPDATE);
			
			_task = task;
		}
		
		override public function clone():Event
		{
			return new UpdateTaskEvent(task);
		}
		
		public function get task():Task
		{
			return _task;
		}
	}
}