package orp.command.events
{
	import flash.events.Event;
	
	import orp.vo.Task;
	
	public class SaveTaskEvent extends Event
	{
		public static const SAVE:String = 'SaveTaskEvent.SAVE';
		
		private var _task:Task;
		
		public function SaveTaskEvent(task:Task)
		{
			super(SAVE);
			
			_task = task;
		}
		
		override public function clone():Event
		{
			return new SaveTaskEvent(task);
		}
		
		public function get task():Task
		{
			return _task;
		}
	}
}