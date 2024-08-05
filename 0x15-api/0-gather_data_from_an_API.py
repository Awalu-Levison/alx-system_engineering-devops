#!/usr/bin/python3
"""
A python script that uses REST API to fetch employee's information
"""
import requests
import sys

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"

    employee_id = sys.argv[1]
    user = requests.get(url + "users/{}".format(employee_id)).json()

    args = {"userId": employee_id}
    todos = requests.get(url + "todos", args).json()

    completed = [t.get("title") for t in todos if t.get("completed") is True]

    print("Employee {} is done with tasks({}/{}):".format(
        user.get("employee_name"), len(completed), len(todos)))

    [print("\t {}".format(complete)) for complete in completed]
