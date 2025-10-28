# GraphQL

## What is GraphQL ?

GraphQL is a data query language developed by Facebook in 2012.

It was published in 2015 and has since been adopted by major tech products like GitHub, YouTube or Pinterest to build the most recent versions of their APIs.

GraphQL provides an alternative to REST and allows clients to define the structure of the data required, and exactly the same structure of the data is returned from the server.  It is a strongly typed runtime which allows clients to dictate what data is needed. This avoids both the problems of over-fetching as well as under-fetching of data.

More information on GraphQL can be found here (amongst plenty of others):

* [http://graphql.org/](http://graphql.org/)
* [https://www.howtographql.com/](https://www.howtographql.com/)


## The GraphQL Endpoint

Where REST has several endpoints, graphQL has just one:

`https://api.clearfacts.be/graphql`

## The Schema

We generate documentation from our GraphQL schema. All calls are validated and executed against the schema.
Use these docs to find out what data you can query, and which operations you can execute.

[View our GraphQL Schema.](https://assets-prod.cdn.clearfacts.be/doc/index.html)

## Examples

Throughout this documentation, we'll provide examples where possible.

However, since every GraphQL or HTTP Client library has its own syntax of actually setting the query and/or variables,
we only provide the plain GraphQL query or mutation itself. Not the function calls to set them in your library of choice.

Regardless, the end result should be:

* a POST request
* to the GraphQL endpoint
* with the Content-Type header set to application/json or application/graphql
* the Authorization header set to `Bearer <token>`
* and the body containing
    * either the full plain query or mutation (only possible with Content-Type application/graphql)
    * or a JSON object with the query/mutation in the `query` key, and variables in the `variables` key

### Operations

* [Queries](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) (REST equivalent: GET calls)
* [Mutations](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) (REST equivalent: POST/DELETE/... calls)
