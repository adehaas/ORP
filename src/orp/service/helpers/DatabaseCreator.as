package orp.service.helpers
{
	import com.probertson.data.QueuedStatement;
	
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	import orp.service.events.DatabaseReadyEvent;
	
	public class DatabaseCreator extends Actor
	{
		[Inject]
		public var sqlRunner:ISQLRunnerDelegate;
		
		public function createDatabaseStructure():void
		{
			var statements:Vector.<QueuedStatement> = new Vector.<QueuedStatement>();
			statements[statements.length] = new QueuedStatement(CREATE_TASKS_SQL);
			
			sqlRunner.executeModify(statements, executeBatchCompleteHandler, executeBatchErrorHandler, null);
		}
		
		private function executeBatchCompleteHandler(results:Vector.<SQLResult>):void
		{
			dispatch(new DatabaseReadyEvent());
		}
		
		private function executeBatchErrorHandler(error:SQLError):void
		{
			dispatch(new SQLErrorEvent(SQLErrorEvent.ERROR, false, false, error));
		}
		
		//STATEMENTS
		[Embed(source='/assets/data/sql/create/CreateTableTasks.sql', mimeType='application/octet-stream')]
		private static const CreateTasksStatementText:Class;
		public static const CREATE_TASKS_SQL:String = new CreateTasksStatementText();
	}
}