#!/usr/bin/env perl

use strict;
use warnings;

use JSON;
use REST::Client;
use Data::Dumper;

my $json = "{\"zipcode\":\"13000-000\",\"number\":183}"; #body

my $rest = REST::Client->new({host => 'https://test.company.com.br', timeout => 2});
$rest->addHeader('Authorization', 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJpc3MiOiJodHRwczp');
$rest->addHeader('Content_Type', 'application/json');
$rest->POST("/feasibility", $json);

#convert result to json
my $result = decode_json ($rest->responseContent());

print Dumper($result);
print "\r\n";
print $rest->responseCode();
print "\r\n";
print $rest->responseContent();

# get specific value inside the json
#print $result->{msg};
