var AWS = require('aws-sdk');

/*
    Mainly for personal use, and/or for team use.

    Because in Federation, docker containers restrict access, this file is
    a script file for ease-of-use.

    KEY CMDS: 'list', 'check', 'rep'
    // Can run one or many of these cmds at once
    Ex: $ node cli.js list check rep
*/

const changeables = {
    accessKeyId: '',
    secretAccessKey: '',
    endpoint: 'http://localhost:8000'
}

const s3 = new AWS.S3({
    accessKeyId: changeables.accessKeyId,
    secretAccessKey: changeables.secretAccessKey,
    sslEnabled: false,
    endpoint: changeables.endpoint,
    s3ForcePathStyle: true,
    apiVersions: { s3: '2006-03-01' },
    signatureVersion: 'v4',
    signatureCache: false,
});

const bucketName = process.argv[2];
const cmds = process.argv.slice(3);

if (cmds.indexOf('list') !== -1) {
    s3.listBuckets({}, (err, data) => {
        if (err) {
            console.log(err);
        } else {
            console.log('List of buckets:');
            console.log(data);
        }
    });
}

if (cmds.indexOf('check') !== -1) {
    s3.headBucket({ Bucket: changeables.bucketName }, (err, data) => {
        if (err) {
            console.log(err);
            exit(1);
        } else {
            console.log(`${bucketName} bucket exists.`);
        }
    });

    s3.getBucketVersioning({ Bucket: changeables.bucketName }, (err, data) => {
    	if (err) {
    		console.log(err);
    	} else {
    		console.log('Versioning: ', data);
    	}
    });
}

if (cmds.indexOf('rep') !== -1) {
    s3.getBucketReplication({ Bucket: changeables.bucketName }, (err, data) => {
    	if (err) {
    		console.log(err);
    	} else {
    		console.log('Replication:', data);
    	}
    });
}
