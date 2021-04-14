import * as React from 'react'
import { ChakraProvider, Container, theme, VStack } from '@chakra-ui/react'

import NavBar from './components/layout/NavBar'
import Footer from './components/layout/Footer'
import Posts from './components/PostsFeed'

export const App = () => {
  return (
    <ChakraProvider theme={theme}>
      <NavBar />
      <Container maxW="container.md">
        <VStack spacing={4} align="stretch">
          <Posts />
        </VStack>
      </Container>
      <Footer />
    </ChakraProvider>
  )
}
