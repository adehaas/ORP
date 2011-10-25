package orp.views
{
	import org.robotlegs.mvcs.Mediator;
	
	import orp.view.TaskList;
	import orp.view.events.DeleteEvent;
	
	public class TaskListMediator extends Mediator
	{
		[Inject]
		public var view:TaskList;
		
		override public function onRegister():void
		{
			addViewListener(DeleteEvent.DELETE, dispatch);
		}
	}
}