#!/usr/bin/python3
"""Export data to CSV"""

import csv
import requests
import sys


if __name__ == '__main__':
    """Get system parameters"""
    user = sys.argv[1]
    url_user = 'https://jsonplaceholder.typicode.com/users/' + user
    user_requ = requests.get(url_user)

    """Employee data"""
    user_name = user_requ.json().get('username')
    task = url_user + '/todos'
    user_requ = requests.get(task)
    tasks = user_requ.json()

    """Export data to csv format"""
    with open('{}.csv'.format(user), 'w') as csvfile:
        for task in tasks:
            completed = task.get('completed')
            """Complete"""
            title_task = task.get('title')
            csvfile.write('"{}","{}","{}","{}"\n'.format(
                user, user_name, completed, title_task))
