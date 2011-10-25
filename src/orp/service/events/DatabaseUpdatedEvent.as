package orp.service.events
{
	import flash.events.Event;
	
	public class DatabaseUpdatedEvent extends Event
	{
		public static const UPDATED:String = 'DatabaseUpdatedEvent.UPDATED'; 
		
		public function DatabaseUpdatedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UPDATED, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new DatabaseUpdatedEvent(bubbles, cancelable);
		}
	}
}