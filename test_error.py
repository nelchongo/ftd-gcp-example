from util.gcp.secret_manager import SecretManager

secret_manager = SecretManager()
print(secret_manager.get_secret("new_test_secret"))