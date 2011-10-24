package orp.command.events
{
	import flash.events.Event;
	
	public class StateExitEvent extends Event
	{
		public static const EXIT:String = 'StateExitEvent.EXIT';
		
		private var _currentState:String;
		
		public function StateExitEvent(currentState:String)
		{
			super(EXIT);
			
			_currentState = currentState;
		}
		
		override public function clone():Event
		{
			return new StateExitEvent(currentState);
		}
		
		public function get currentState():String
		{
			return _currentState;
		}
	}
}