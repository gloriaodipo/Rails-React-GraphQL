import ApolloClient from "apollo-boost";
import gql from "graphql-tag";

export const client = new ApolloClient({
  uri: "/graphql",
})

// define graphql queries here, similar to what we send using rails Graphiql Engine
export const CREATE_BOOK = gql `
  mutation CreateBook($title: String!, $author: String, $review: String!, $reviewer: String!){
    createBook(
      input: {
        title: $title
        author: $author
        review:  $review
        reviewer: $reviewer
    }){
      book{
          id
          author
          title
      }
    }
  }
`

// get a single book query
export const GET_BOOK = gql `
  query getBook($bookId: ID!){
    book(id: bookId$){
        title
    }
  }
`
