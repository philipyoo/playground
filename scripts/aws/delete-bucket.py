import sys
import boto3

BUCKET = str(sys.argv[1])

s3 = boto3.resource('s3',
                    aws_access_key_id='7KIWN4M0YMS95T3U3ZXY',
                    aws_secret_access_key='JMhl12n4cKr1XMf+/xFK5XSyP8+Yfjkba0W6/U1j',
                    endpoint_url='http://localhost')
bucket = s3.Bucket(BUCKET)
bucket.object_versions.delete()

bucket.delete()
