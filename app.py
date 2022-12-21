from datetime import datetime
from flask import Flask
from flask import jsonify
import socket
import psutil
app = Flask(__name__)
@app.route('/')
def default():
    return "go to status page"


@app.route('/status')
def name():
    hostname = socket.gethostname()
    Ipaddres = socket.gethostbyname(hostname)
    date = datetime.now()
    cpu = psutil.cpu_percent(interval=0.5)

    mem_value = psutil.virtual_memory()[1]


    result = {

            "status system": "up",
            "hostname": hostname,
            "ipaddres": Ipaddres,
            "date": date,
            "mem": mem_value,
            "cpu_usage is ": cpu,
            }

    return jsonify(str(result))
