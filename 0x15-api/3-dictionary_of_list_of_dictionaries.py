#!/usr/bin/python3
"""
gather employee data from API
"""

import json
import requests


def display_employee_info():
    url = "https://jsonplaceholder.typicode.com/"

    users = requests.get(url + "users").json()

    """data to export"""
    employee_data = {}

    for user in users:
        user_id = user["id"]

        user_response = requests.get(url + f"todos?userId={user_id}")
        task_list = user_response.json()

        employee_data[user_id] = []
        for task in task_list:
            task_data = {
                    "username": user.get("username"),
                    "task": user.get("title"),
                    "completed": user.get("completed")
                    }

            employee_data[user_id].append(task_data)
            return employee_data

    if __name__ == "__main__":
        employee_data = display_employee_info()

    with open("todo_all_employees.json", "w") as json_file:
        json.dump(employee_data, json_file, indent=4)
