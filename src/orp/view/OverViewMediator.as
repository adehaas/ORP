package orp.view
{
	import org.robotlegs.mvcs.Mediator;
	
	import orp.command.events.OrpResultEvent;
	
	public class OverViewMediator extends Mediator
	{
		[Inject]
		public var view:OverView;
		
		override public function onRegister():void
		{
			addContextListener(OrpResultEvent.RESULTS, handleResults);
		}
		
		private function handleResults(event:OrpResultEvent):void
		{
			view.meanResult.text = event.meanResult.toPrecision(2);
			view.deviationResult.text = event.deviationResult.toPrecision(2);
		}
	}
}