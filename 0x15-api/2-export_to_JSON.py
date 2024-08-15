#!/usr/bin/python3
"""
gather employee data from API
"""

import json
import requests
import sys


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com/"

    userID = sys.argv[1]

    user = requests.get(url + "users/{}".format(userID)).json()

    username = user.get("username")
    params = {"userID": userID}
    todos = requests.get(url + "/todos", params={"userID": userID}).json()

    data_to_export = {userID: []}

    for todo in todos:
        data_format = {
                "task": todo.get("title"),
                "completed": todo.get("completed"),
                "username": username
                }

        data_to_export[userID].append(data_format)

    with open("{}.json".format(userID), "w") as json_file:
        json.dump(data_to_export, json_file, indent=4)
