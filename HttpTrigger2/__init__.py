import logging

import azure.functions as func


def main(req: func.HttpRequest, msg: func.Out[str]) -> func.HttpResponse:
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
    if not message:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('message')

    if name and message:
        msg.set(f"{name}:{message}")
        return func.HttpResponse(f"Thank you {name}, for your message: {message}")
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name and message in the query string or in the request body for a personalized response.",
             status_code=200
        )
