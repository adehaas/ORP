package orp.service
{
	import com.probertson.data.QueuedStatement;
	
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.DataEvent;
	
	import flashx.textLayout.events.ModelChange;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	import orp.model.TaskListModel;
	import orp.model.events.TaskEvent;
	import orp.service.events.DatabaseReadyEvent;
	import orp.service.helpers.ISQLRunnerDelegate;
	import orp.vo.Task;
	
	public class SQLTaskService extends Actor implements ITaskService
	{
		[Inject]
		public var sqlRunner:ISQLRunnerDelegate;
		
		[Inject]
		public var taskListModel:TaskListModel;
		
		public function loadAllTasks():void
		{
			taskListModel.reset();
			sqlRunner.execute(LOAD_ALL_TASKS_SQL, null, loadAllTasksResultHandler, Task, databaseErrorHandler)
		}
		
		private function loadAllTasksResultHandler(result:SQLResult):void
		{
			for each(var task:Task in result.data)
				taskListModel.addTask(task);
		}
		
		private function databaseErrorHandler(error:SQLError):void
		{
			dispatch(new DatabaseErrorHandlerEvent(error.message));
		}
		
		public function loadTaskById(id:int):void
		{
			sqlRunner.execute(LOAD_TASK_SQL, {taskId:id}, loadTaskResultHandler, Task);
		}
		
		private function loadTaskResultHandler(result:SQLResult):void
		{
			var task:Task = result.data[0] as Task;
			
			task = taskListModel.updateTask(task);
		}
		
		public function save(task:Task):void
		{
			var params:Object = task.toParamObject();
			
			sqlRunner.executeModify(Vector.<QueuedStatement>(
				[new QueuedStatement(SAVE_TASK_SQL, params)]), saveTaskResultHandler, databaseErrorHandler);
		}
		
		
		private function saveTaskResultHandler(results:Vector.<SQLResult>):void
		{
			var result:SQLResult = results[0];
			if (result.rowsAffected > 0)
			{
				var id:Number = result.lastInsertRowID;
				loadTaskById(id);
			}
		}
		
		public function deleteTask(task:Task):void
		{
			sqlRunner.executeModify(Vector.<QueuedStatement>([new QueuedStatement(DELETE_TASK_SQL, {taskId:task.taskId})]),
				deleteTaskResult, databaseErrorHandler);
		}
		
		private function deleteTaskResult(results:Vector.<SQLResult>):void
		{
			dispatch(new DatabaseReadyEvent);
		}
		
		[Embed(source="/assets/data/sql/tasks/SaveTask.sql", mimeType="application/octet-stream")]
		private static const SaveTaskStatementText:Class;
		public static const SAVE_TASK_SQL:String = new SaveTaskStatementText();
		
		[Embed(source="/assets/data/sql/tasks/DeleteTask.sql", mimeType="application/octet-stream")]
		private static const DeleteTaskStatementText:Class;
		public static const DELETE_TASK_SQL:String = new DeleteTaskStatementText();
		
		[Embed(source="/assets/data/sql/tasks/LoadTask.sql", mimeType="application/octet-stream")]
		private static const LoadTaskStatementText:Class;
		public static const LOAD_TASK_SQL:String = new LoadTaskStatementText();
		
		[Embed(source="/assets/data/sql/tasks/LoadAllTasks.sql", mimeType="application/octet-stream")]
		private static const LoadAllTasksStatementText:Class;
		public static const LOAD_ALL_TASKS_SQL:String = new LoadAllTasksStatementText();
	}
}