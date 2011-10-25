package orp.view.events
{
	import flash.events.Event;
	
	import spark.components.TextInput;
	
	public class TextInputChangeEvent extends Event
	{
		public static const CHANGE:String = 'TextInputChangeEvent.CHANGE';
		
		private var _input:TextInput;
		
		public function TextInputChangeEvent(input:TextInput)
		{
			super(CHANGE);
			
			_input = input;
		}
		
		override public function clone():Event
		{
			return new TextInputChangeEvent(input);
		}
		
		public function get input():TextInput
		{
			return _input;
		}
	}
}