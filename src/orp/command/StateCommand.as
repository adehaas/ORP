package orp.command
{
	import org.robotlegs.mvcs.Command;
	
	import orp.command.events.OrpResultEvent;
	import orp.command.events.StateExitEvent;
	import orp.model.TaskListModel;
	import orp.utils.Calculator;
	import orp.vo.Task;
	
	public class StateCommand extends Command
	{
		private static const PORTRAIT:String = 'portrait';
		
		[Inject]
		public var event:StateExitEvent;
		
		[Inject]
		public var model:TaskListModel;
		
		override public function execute():void
		{
			commandMap.detain(this);
			
			if(event.currentState == PORTRAIT)
				calculcateSequences();
		}
		
		private function calculcateSequences():void
		{
			var meanValues:Array = [];
			var deviationValues:Array = [];
			
			for each(var task:Task in model.tasks)
			{
				meanValues.push(task.mean);
				deviationValues.push(task.deviation);
			}
			var meanResult:Number = Calculator.calculateMeanSequence(meanValues);
			var deviationResult:Number = Calculator.calculateDeviationSequence(deviationValues);
			
			model.meanResult = meanResult;
			model.deviationResult = deviationResult;
			
			eventDispatcher.dispatchEvent(new OrpResultEvent(OrpResultEvent.RESULTS, meanResult, deviationResult));
			
			commandMap.release(this);
		}
	}
}