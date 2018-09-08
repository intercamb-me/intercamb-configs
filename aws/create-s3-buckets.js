'use strict'

const AWS = require('aws-sdk');

const s3 = new AWS.S3();

const BUCKET_POLICY = {
  'Version': '2008-10-17',
  'Id': 'PolicyForCloudFrontPrivateContent',
  'Statement': [
    {
      'Sid': '1',
      'Effect': 'Allow',
      'Principal': {
        'AWS': 'arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3C9ZY38VFBX7E',
      },
      'Action': 's3:GetObject',
      'Resource': 'arn:aws:s3:::intercamb/*',
    },
    {
      'Sid': '2',
      'Effect': 'Deny',
      'NotPrincipal': {
        'AWS': 'arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3C9ZY38VFBX7E',
      },
      'Action': 's3:GetObject',
      'Resource': 'arn:aws:s3:::intercamb/*',
    },
  ],
};

async function createBucket(name, acl) {
  await s3.createBucket({
    Bucket: name,
    ACL: acl,
    CreateBucketConfiguration: {
      LocationConstraint: 'eu-west-1'
    }
  }).promise();
  await s3.putBucketPolicy().promise({
    Bucket: name,
    Policy: JSON.stringify(policyConfig, null, 2),
  });
}

async function exec() {
  await s3.createBucket('intercamb', 'public-read');
  await s3.createBucket('intercamb-public', 'public-read');
  await s3.createBucket('intercamb-private', 'private');
}
