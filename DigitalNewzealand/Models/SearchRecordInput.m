//
//  SearchRecordInput.m
//  DigitalNewzealand
//
//  This file was automatically generated by APIMATIC BETA v2.0 on 06/28/2016
//
#import "SearchRecordInput.h"

@implementation SearchRecordInput

/**
* TODO: Write general description for this method
*/
@synthesize text;

/**
* Restricts search to records matching all facet values. Example: "&and[content_partner][]=Kete+Horowhenua&and[category][]=Images"
*/
@synthesize and;

/**
* Restricts search to records matching any of the specified facet values. Example: "&or[category][]=Image&or[category][]=Videos"without 
*/
@synthesize or;

/**
* Restricts search to records that don't match any of the facet values. Example: "&without[category][]=Newspapers"
*/
@synthesize without;

/**
* the page when iterating over a set of records. (Defaults to 1.)
*/
@synthesize page;

/**
* the number of records the user wishes returned up to a maximum of 100. (Defaults to 20.)
*/
@synthesize perPage;

/**
* a list of facet fields to include in the output. See the note on facets below for more information. Example: "&facets=year,category"
*/
@synthesize facets;

/**
* the facet page to iterate over a set of facets. . (Defaults to 1.)
*/
@synthesize facetsPage;

/**
* the number of facets returned for every page. (Defaults to 10.)
*/
@synthesize facetPerPage;

/**
* the field upon which results are sorted. Defaults to relevance sorting. The sort field must be one of: "category", "content_partner", "date", "syndication_date".
*/
@synthesize sort;

/**
*  the direction in which the results are sorted. Possible values: "desc", "asc".
*/
@synthesize direction;

/**
* a geographic bounding box scoping a search to a geographic region. Order of latitude-longitude coordinates is north, west, south, east. For example, &geo_bbox=-41,174,-42,175 searches the Wellington region.
*/
@synthesize geoBbox;

-(id)init
{
    if (self = [super init])
    {
        self.page = 1;
        self.perPage = 20;
        self.facetsPage = 1;
        self.facetPerPage = 10;
    }
    return self;
}

@end