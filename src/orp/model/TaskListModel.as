package orp.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import orp.model.events.TaskEvent;
	import orp.vo.Task;
	
	public class TaskListModel extends Actor
	{
		private var _tasks:ArrayCollection;
		
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
	}
}