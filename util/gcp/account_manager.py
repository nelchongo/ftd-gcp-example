class AccountManager():
    def __init__(self, project_id:str = None):
        #overwrite project id if needed
        self.project_id = project_id if project_id is not None else "data-analytics-test-426921"