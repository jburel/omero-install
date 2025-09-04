import omero
client = omero.client('localhost')
client.closeSession()
#from omero.util.upgrade_check import UpgradeCheck
#uc=UpgradeCheck('test', url='https://www.openmicroscopy.org')
#uc.run()
import requests
r = requests.get('https://www.glencoesoftware.com/')
print(r.status_code)
