SELECT taskId,
	name,
	mean,
	deviation,
	optimistic,
	realistic,
	pessimistic
FROM main.tasks
ORDER BY taskId COLLATE NOCASE