import { gql } from '@apollo/client'

export default gql`
  query {
    posts {
      id
      title
      body
      createdAt
      updatedAt
      liked
      likesCount
      imageUrl
      comments {
        body
      }
      user {
        id
        fullName
        username
        avatarUrl
      }
    }
  }
`
