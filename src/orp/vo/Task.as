package orp.vo
{
	[Bindable]
	public class Task
	{
		public var taskId:int = 0;
		public var name:String = '';
		public var mean:Number = 0;
		public var deviation:Number = 0;
		
		public var optimistic:Number = 0;
		public var realistic:Number = 0;
		public var pessimistic:Number = 0;
		
		public function Task(name:String = '')
		{
			this.name = name;
		}
		
		public function update(task:Task):Task
		{
			taskId = task.taskId;
			name = task.name;
			mean = task.mean;
			deviation = task.deviation;
			optimistic = task.optimistic;
			realistic = task.realistic;
			pessimistic = task.pessimistic;
			
			return this;
		}
		
		public function toParamObject():Object
		{
			var params:Object = new Object();
			params['taskId'] = taskId > 0 ? taskId : null;
			params['name'] = name;
			params['mean'] = mean > 0 ? mean : 0;
			params['deviation'] = deviation > 0 ? deviation : 0;
			params['optimistic'] = optimistic > 0 ? optimistic : 0;
			params['realistic'] = realistic > 0 ? realistic : 0;
			params['pessimistic'] = pessimistic > 0 ? pessimistic : 0;
			
			return params;
		}
	}
}