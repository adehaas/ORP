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
		
		public static function calculateMeanSequence(values:Array):Number
		{
			var result:Number = 0;
			
			for (var i:int = 0; i < values.length; i++) 
				result += Number(values[i]);
			
			return result;
		}
		
		public static function calculateDeviationSequence(values:Array):Number
		{
			var result:Number = 0;
			var tempResult:Number = 0;
			
			for (var i:int = 0; i < values.length; i++) 
				tempResult += Number(values[i]) * Number(values[i]);
			
			result = Math.sqrt(tempResult);
			return result;
		}
	}
}