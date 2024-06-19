from .account_manager import AccountManager
from google.cloud import secretmanager

class SecretManager(AccountManager):
    def __init__(self, project_id:str = None):
        super().__init__(project_id)
        self.client = secretmanager.SecretManagerServiceClient()
        
    def get_secret(self, secret_id:str, version_id:str = 'latest'):
        name = f"projects/{self.project_id}/secrets/{secret_id}/versions/{version_id}"
        response = self.client.access_secret_version(name=name)
        secret_payload = response.payload.data.decode('UTF-8')
        return secret_payload

#Example test for class    
#secret_manager = SecretManager()
#print(secret_manager.get_secret("analytics-test-secret"))