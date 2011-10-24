package orp.view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.ItemClickEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import orp.command.events.SaveTaskEvent;
	import orp.command.events.UpdateTaskEvent;
	import orp.model.TaskListModel;
	import orp.model.events.TaskEvent;
	import orp.service.ITaskService;
	import orp.view.events.DeleteEvent;
	import orp.view.events.ItemEvent;
	import orp.vo.Task;
	
	import spark.events.TextOperationEvent;
	
	public class TaskViewMediator extends Mediator
	{
		[Inject]
		public var view:TaskView;
		
		[Inject]
		public var model:TaskListModel;
		
		override public function onRegister():void 
		{
			view.taskList.dataProvider = model.tasks;
			
			view.addTaskButton.addEventListener(MouseEvent.CLICK, saveTask);
			view.optimisticInput.addEventListener(Event.CHANGE, handleInputChange);
			view.realisticInput.addEventListener(Event.CHANGE, handleInputChange);
			view.pessimisticInput.addEventListener(Event.CHANGE, handleInputChange);
			
			view.taskList.addEventListener(DeleteEvent.DELETE, redispatchDeleteEvent);
			
			eventDispatcher.addEventListener(TaskEvent.UPDATE, updateTaskList);
		}
		
		private function updateTaskList(event:TaskEvent):void
		{
			debug(model.tasks);
		}
		
		protected function redispatchDeleteEvent(event:Event):void
		{
			dispatch(event);
		}
		
		protected function handleInputChange(event:TextOperationEvent):void
		{
			var task:Task = view.taskList.selectedItem as Task;
			switch(event.target)
			{
				case view.optimisticInput:
					task.optimistic = Number(view.optimisticInput.text);
					break;
				case view.realisticInput:
					task.realistic = Number(view.realisticInput.text);
					break;
				case view.pessimisticInput:
					task.pessimistic = Number(view.pessimisticInput.text);
					break;
			}
			dispatch(new UpdateTaskEvent(task));
		}
		
		private function saveTask(event:Event):void
		{
			var task:Task = new Task();
			task.name = view.taskInput.text;
			
			dispatch(new SaveTaskEvent(task));
		}
	}
}