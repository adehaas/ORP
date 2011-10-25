package orp.command.events
{
	import flash.events.Event;
	
	public class OrpResultEvent extends Event
	{
		public static const RESULTS:String = 'ResultEvent.RESULTS';
		
		private var _meanResult:Number;
		private var _deviationResult:Number;
		
		public function OrpResultEvent(type:String, meanResult:Number, deviationResult:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_meanResult = meanResult;
			_deviationResult = deviationResult;
		}
		
		override public function clone():Event
		{
			return new OrpResultEvent(type, meanResult, deviationResult, bubbles, cancelable);
		}
		
		public function get meanResult():Number
		{
			return _meanResult;
		}
		
		public function get deviationResult():Number
		{
			return _deviationResult;
		}
	}
}