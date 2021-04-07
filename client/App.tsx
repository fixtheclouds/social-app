import * as React from "react"
import {
  ChakraProvider,
  Container,
  theme,
  VStack,
} from "@chakra-ui/react"

import NavBar from "./components/layout/NavBar"
import Footer from "./components/layout/Footer"
import Post from "./components/Post"

export const App = () => {

  return (
    <ChakraProvider theme={theme}>
      <NavBar />
      <Container maxW="container.md">
        <VStack spacing={4} align="stretch">
          <Post />
          <Post />
          <Post />
        </VStack>
      </Container>
      <Footer />
    </ChakraProvider>
  )
}
