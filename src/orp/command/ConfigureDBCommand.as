package orp.command
{
	import flash.filesystem.File;
	
	import org.robotlegs.mvcs.Command;
	
	import orp.service.events.DatabaseReadyEvent;
	import orp.service.helpers.DatabaseCreator;
	import orp.service.helpers.ISQLRunnerDelegate;
	import orp.service.helpers.SQLRunnerDelegate;
	
	public class ConfigureDBCommand extends Command
	{
		private static const DB:String = 'orp.db';
		
		override public function execute():void
		{
			var db:File = File.applicationStorageDirectory.resolvePath(DB);
			var sqlRunner:ISQLRunnerDelegate = new SQLRunnerDelegate(db);
			
			injector.mapValue(ISQLRunnerDelegate, sqlRunner);
			
			if(!db.exists)
			{
				var creator:DatabaseCreator = injector.instantiate(DatabaseCreator);
				creator.createDatabaseStructure();
			} 
			else 
				dispatch(new DatabaseReadyEvent());
		}
	}
}