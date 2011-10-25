package orp.command
{
	import org.robotlegs.mvcs.Command;
	
	import orp.service.ITaskService;
	import orp.view.events.DeleteEvent;
	
	public class DeleteTaskCommand extends Command
	{
		[Inject]
		public var service:ITaskService;
		
		[Inject]
		public var event:DeleteEvent;
		
		override public function execute():void	
		{
			warn();
			service.deleteTask(event.task);
		}
	}
}