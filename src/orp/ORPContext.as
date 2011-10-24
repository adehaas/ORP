package orp
{
	import flash.display.DisplayObjectContainer;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Context;
	
	import orp.command.ConfigureDBCommand;
	import orp.command.DeleteTaskCommand;
	import orp.command.LoadTasksCommand;
	import orp.command.SaveTaskCommand;
	import orp.command.UpdateTaskCommand;
	import orp.command.events.SaveTaskEvent;
	import orp.command.events.UpdateTaskEvent;
	import orp.model.TaskListModel;
	import orp.service.ITaskService;
	import orp.service.SQLTaskService;
	import orp.service.events.DatabaseReadyEvent;
	import orp.view.TaskView;
	import orp.view.TaskViewMediator;
	import orp.view.events.DeleteEvent;
	import orp.view.events.ItemEvent;
	import orp.vo.Task;
	
	public class ORPContext extends Context
	{
		public function ORPContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(TaskListModel);
			
			injector.mapSingletonOf(ITaskService, SQLTaskService);
			
			mediatorMap.mapView(TaskView, TaskViewMediator);
			
			commandMap.mapEvent(FlexEvent.APPLICATION_COMPLETE, ConfigureDBCommand);
			commandMap.mapEvent(DatabaseReadyEvent.READY, LoadTasksCommand);
			commandMap.mapEvent(SaveTaskEvent.SAVE, SaveTaskCommand);
			commandMap.mapEvent(UpdateTaskEvent.UPDATE, UpdateTaskCommand);
			commandMap.mapEvent(DeleteEvent.DELETE, DeleteTaskCommand);
		}
	}
}