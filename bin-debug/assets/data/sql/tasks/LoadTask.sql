SELECT taskId,
	name,
	mean,
	deviation,
	optimistic,
	realistic,
	pessimistic
FROM main.tasks
WHERE taskId = :taskId