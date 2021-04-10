import { gql } from '@apollo/client'

export default gql`
  query {
    posts {
      id
      title
      body
      comments {
          body
      }
      user {
          id
          username
      }
    }
  }
`
