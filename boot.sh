#!/bin/bash
# this script is used to boot a Docker container
source venv/bin/activate
# exec gunicorn -b :5000 --access-logfile - --error-logfile - scanuser:code
export BASEPATH="`pwd`"
flask run --host=0.0.0.0