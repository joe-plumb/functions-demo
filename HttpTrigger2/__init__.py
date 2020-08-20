import logging

import azure.functions as func


def main(req: func.HttpRequest) -> str:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    message = req.params.get('message')

    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')
            message = req_body.get('message')

    if name:
        return (f"{name} : {message}")
    else:
        return (f"'error': 1")
