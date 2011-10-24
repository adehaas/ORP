package orp.command
{
	import org.robotlegs.mvcs.Command;
	
	import orp.service.ITaskService;
	
	public class LoadTasksCommand extends Command
	{
		[Inject]
		public var service:ITaskService;
		
		override public function execute():void
		{
			notice();
			service.loadAllTasks();
		}
	}
}