import json
import os
import boto3

TABLE = os.environ.get("TABLE_NAME")
ddb = boto3.client("dynamodb")

def lambda_handler(event, context):
    # Simple echo + put item into DynamoDB (example)
    body = {
        'message': 'hello from lambda',
        'input': event
    }
    if TABLE:
        try:
            ddb.put_item(
                TableName=TABLE,
                Item={
                    'id': {'S': context.aws_request_id},
                    'payload': {'S': json.dumps(event)}
                }
            )
            body['ddb'] = 'ok'
        except Exception as e:
            body['ddb_error'] = str(e)

    return {
        'statusCode': 200,
        'body': json.dumps(body)
    }
