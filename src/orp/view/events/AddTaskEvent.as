package orp.view.events
{
	import flash.events.Event;
	import flash.net.dns.AAAARecord;
	
	public class AddTaskEvent extends Event
	{
		public static const ADD:String = 'AddTaskToListEvent.ADD';
		
		public function AddTaskEvent()
		{
			super(ADD);
		}
		
		override public function clone():Event
		{
			return new AddTaskEvent();
		}
	}
}