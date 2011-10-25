package orp.view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.operations.RedoOperation;
	
	import mx.collections.ArrayCollection;
	import mx.events.ItemClickEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import orp.command.events.SaveTaskEvent;
	import orp.command.events.UpdateTaskEvent;
	import orp.model.TaskListModel;
	import orp.model.events.TaskEvent;
	import orp.service.ITaskService;
	import orp.service.events.DatabaseReadyEvent;
	import orp.service.events.DatabaseUpdatedEvent;
	import orp.view.events.AddTaskEvent;
	import orp.view.events.DeleteEvent;
	import orp.view.events.ItemEvent;
	import orp.view.events.TextInputChangeEvent;
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
			
			addViewListener(AddTaskEvent.ADD, saveTask);
			addViewListener(TextInputChangeEvent.CHANGE, handleInputChange);
			
			eventDispatcher.addEventListener(DatabaseUpdatedEvent.UPDATED, updateFields);
		}
		
		private function updateFields(event:DatabaseUpdatedEvent):void
		{
			view.optimisticInput.text = '';
			view.realisticInput.text = '';
			view.pessimisticInput.text = '';
		}
		
		protected function handleInputChange(event:TextInputChangeEvent):void
		{
			var task:Task = view.taskList.selectedItem as Task;
			switch(event.input)
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
			
			view.taskInput.text = '';
		}
	}
}