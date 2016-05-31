//
//  MetadataController.m
//  DigitalNewzealand
//
//  This file was automatically generated by APIMATIC BETA v2.0 on 05/31/2016
//
#import "MetadataController.h"

@implementation MetadataController

/**
* The Get Metadata API call returns the available metadata for a specific item. The Get Metadata v3 request parameters and response format differs significantly from the depreciated Get Metadata v1 & v2 API call.
* @param  GetMetadataInput     Object with all parameters
* @return	Returns the CollectionSearchRecords* response from the API call */
- (void) getMetadataAsyncWithGetMetadataInput:(GetMetadataInput*) input
                completionBlock:(CompletedGetMetadata) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/v3/records/{record_id}.json"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"record_id": input.recordId
                }];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withQueryParameters: @{
                    @"fields": input.fields,
                    @"api_key": [Configuration ApiKey]
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             CollectionSearchRecords* result = (CollectionSearchRecords*) [APIHelper jsonDeserialize: strResult
                toClass: CollectionSearchRecords.class];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}


@end