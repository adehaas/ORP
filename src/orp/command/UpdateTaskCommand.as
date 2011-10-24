package orp.command
{
	import org.robotlegs.mvcs.Command;
	
	import orp.command.events.UpdateTaskEvent;
	import orp.service.ITaskService;
	import orp.utils.Calculator;
	import orp.vo.Task;
	
	public class UpdateTaskCommand extends Command
	{
		[Inject]
		public var service:ITaskService;
		
		[Inject]
		public var event:UpdateTaskEvent;
		
		override public function execute():void
		{
			var task:Task = event.task;
			task.mean = Calculator.meanDeviation([task.optimistic, task.realistic, task.pessimistic])[0];
			task.deviation = Calculator.meanDeviation([task.optimistic, task.realistic, task.pessimistic])[1];
			
			service.save(event.task);
		}
	}
}