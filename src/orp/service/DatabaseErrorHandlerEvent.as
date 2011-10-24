package orp.service
{
	import flash.events.Event;
	
	public class DatabaseErrorHandlerEvent extends Event
	{
		public static const ERROR:String = 'DatabaseErrorHandlerEvent.ERROR';
		
		private var _message:String = '';
		
		public function DatabaseErrorHandlerEvent(message:String)
		{
			super(ERROR);
			
			_message = message;
		}
		
		override public function clone():Event
		{
			return new DatabaseErrorHandlerEvent(message)
		}
		
		public function get message():String
		{
			return _message;
		}
	}
}