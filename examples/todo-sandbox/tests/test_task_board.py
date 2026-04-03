import sys
import unittest
from pathlib import Path


sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from task_board import TaskBoard


class TaskBoardTests(unittest.TestCase):
    def test_add_task_normalizes_title_and_assigns_ids(self) -> None:
        board = TaskBoard()

        first = board.add_task("  Write docs  ")
        second = board.add_task("Ship examples")

        self.assertEqual(first.id, 1)
        self.assertEqual(first.title, "Write docs")
        self.assertEqual(second.id, 2)

    def test_empty_title_is_rejected(self) -> None:
        board = TaskBoard()

        with self.assertRaisesRegex(ValueError, "must not be empty"):
            board.add_task("   ")

    def test_complete_missing_task_raises_key_error(self) -> None:
        board = TaskBoard()

        with self.assertRaisesRegex(KeyError, "Unknown task id"):
            board.complete_task(99)

    def test_list_tasks_filters_by_status(self) -> None:
        board = TaskBoard()
        first = board.add_task("Open item")
        second = board.add_task("Completed item")
        board.complete_task(second.id)

        self.assertEqual([task.id for task in board.list_tasks("all")], [first.id, second.id])
        self.assertEqual([task.id for task in board.list_tasks("open")], [first.id])
        self.assertEqual([task.id for task in board.list_tasks("completed")], [second.id])

    def test_summary_counts_tasks_without_mutating_state(self) -> None:
        board = TaskBoard()
        first = board.add_task("Draft plan")
        second = board.add_task("Run tests")
        board.complete_task(first.id)

        before_snapshot = board.snapshot()
        summary = board.summary()
        after_snapshot = board.snapshot()

        self.assertEqual(summary, {"all": 2, "open": 1, "completed": 1})
        self.assertEqual(before_snapshot, after_snapshot)
        self.assertEqual(after_snapshot[1]["id"], second.id)

    def test_snapshot_is_deterministic_and_ordered_by_id(self) -> None:
        board = TaskBoard()
        first = board.add_task("Capture scope")
        second = board.add_task("Verify output")
        board.complete_task(first.id)

        snapshot = board.snapshot()

        self.assertEqual(
            snapshot,
            [
                {"id": 1, "title": "Capture scope", "completed": True},
                {"id": 2, "title": "Verify output", "completed": False},
            ],
        )
        self.assertEqual(snapshot[1]["id"], second.id)


if __name__ == "__main__":
    unittest.main()
