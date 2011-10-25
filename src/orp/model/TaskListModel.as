package orp.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import orp.model.events.TaskEvent;
	import orp.vo.Task;
	
	public class TaskListModel extends Actor
	{
		private var _tasks:ArrayCollection;
		private var _meanResult:Number;
		private var _deviationResult:Number;
		
		public function get tasks():ArrayCollection
		{
			return _tasks ||= new ArrayCollection();
		}
		
		public function updateTask(selTask:Task):Task
		{
			for each(var task:Task in tasks)
			{
				if(task.taskId == selTask.taskId)
					return task.update(selTask);
			}
			
			addTask(selTask);
			
			return selTask;
		}
		
		public function getTaskById(id:int):Task
		{
			for each(var task:Task in tasks)
			{
				if(task.taskId == id)
					return task;
			}
			
			return null;
		}
		
		public function addTask(task:Task):void
		{
			if(!tasks.contains(task))
				tasks.addItem(task);
		}
		
		public function reset():void
		{
			tasks.removeAll();
		}

		public function get meanResult():Number
		{
			return _meanResult;
		}

		public function set meanResult(value:Number):void
		{
			_meanResult = value;
		}

		public function get deviationResult():Number
		{
			return _deviationResult;
		}

		public function set deviationResult(value:Number):void
		{
			_deviationResult = value;
		}


	}
}