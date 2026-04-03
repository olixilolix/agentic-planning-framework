from __future__ import annotations

from dataclasses import dataclass, replace


@dataclass(frozen=True)
class Task:
    id: int
    title: str
    completed: bool = False


class TaskBoard:
    def __init__(self) -> None:
        self._tasks: list[Task] = []
        self._next_id = 1

    def add_task(self, title: str) -> Task:
        normalized_title = self._normalize_title(title)
        task = Task(id=self._next_id, title=normalized_title)
        self._tasks.append(task)
        self._next_id += 1
        return task

    def complete_task(self, task_id: int) -> Task:
        for index, task in enumerate(self._tasks):
            if task.id == task_id:
                completed_task = replace(task, completed=True)
                self._tasks[index] = completed_task
                return completed_task

        raise KeyError(f"Unknown task id: {task_id}")

    def list_tasks(self, status: str = "all") -> list[Task]:
        if status not in {"all", "open", "completed"}:
            raise ValueError(f"Unsupported status: {status}")

        if status == "all":
            return list(self._tasks)
        if status == "open":
            return [task for task in self._tasks if not task.completed]
        return [task for task in self._tasks if task.completed]

    def summary(self) -> dict[str, int]:
        completed = sum(1 for task in self._tasks if task.completed)
        total = len(self._tasks)
        return {
            "all": total,
            "open": total - completed,
            "completed": completed,
        }

    def snapshot(self) -> list[dict[str, object]]:
        return [
            {
                "id": task.id,
                "title": task.title,
                "completed": task.completed,
            }
            for task in self._tasks
        ]

    @staticmethod
    def _normalize_title(title: str) -> str:
        normalized_title = title.strip()
        if not normalized_title:
            raise ValueError("Task title must not be empty")
        return normalized_title
