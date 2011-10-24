package orp.utils
{
	public class Calculator
	{
		public static function meanDeviation(values:Array):Array
		{
			var mean:Number = 0;
			var deviation:Number = 0;
			mean = (Number(values[0]) + (4 * Number(values[1])) + Number(values[2])) / 6;
			deviation = (Number(values[2]) - Number(values[0])) / 6;
			
			var result:Array = [mean, deviation];
			return result;
		}
	}
}