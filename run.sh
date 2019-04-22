source venv/bin/activate
export FLASK_APP=code/web.py

export BASEPATH="`pwd`"
# echo "Running from directory: "$BASEPATH
# exec gunicorn -b 0.0.0.0:5000 --access-logfile - --error-logfile - code.web:app
flask run -h 0.0.0.0
