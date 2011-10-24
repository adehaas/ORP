CREATE TABLE main.tasks
(
	taskId INTEGER PRIMARY KEY AUTOINCREMENT,
	name String NOT NULL,
    mean FLOAT,
    deviation FLOAT,
    optimistic FLOAT,
    realistic FLOAT,
    pessimistic FLOAT
)