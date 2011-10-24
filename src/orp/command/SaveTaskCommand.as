package orp.command
{
	import org.robotlegs.mvcs.Command;
	
	import orp.command.events.SaveTaskEvent;
	import orp.service.ITaskService;
	
	public class SaveTaskCommand extends Command
	{
		[Inject]
		public var event:SaveTaskEvent;
		[Inject]
		public var service:ITaskService;
		
		override public function execute():void
		{
			service.save(event.task);
		}
	}
}