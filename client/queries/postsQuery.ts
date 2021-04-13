import { gql } from '@apollo/client'

export default gql`
  query {
    posts {
      id
      title
      body
      createdAt
      comments {
        body
      }
      imageUrl
      user {
        id
        fullName
        username
        avatarUrl
      }
    }
  }
`
