#!flask/bin/python

#region run app via local server
from app import app as application
if __name__ == '__main__':
  application.run(host='0.0.0.0', port=8080, debug=True, threaded=True)
#endregion run app via local server
