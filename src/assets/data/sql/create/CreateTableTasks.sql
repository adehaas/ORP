CREATE TABLE main.tasks
(
	taskId INTEGER PRIMARY KEY AUTOINCREMENT,
	name String NOT NULL,
    mean INT,
    deviation INT,
    optimistic INT,
    realistic INT,
    pessimistic INT
)