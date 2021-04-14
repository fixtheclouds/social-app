import { ApolloClient, InMemoryCache } from '@apollo/client'

const client = new ApolloClient({
  // TODO: this should not be hardcoded
  uri: 'http://localhost:3000/graphql',
  cache: new InMemoryCache(),
})

export default client
