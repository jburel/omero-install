import omero
client = omero.client('localhost')
client.closeSession()
#from omero.util.upgrade_check import UpgradeCheck
#uc=UpgradeCheck('test', url='https://www.openmicroscopy.org')
#uc.run()
import requests
r = requests.get('https://www.glencoesoftware.com/')
if r.status_code != 200:
    raise Exception("Code should be 200")
