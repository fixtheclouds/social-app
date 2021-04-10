import * as React from "react"
import { useQuery } from '@apollo/client'
import postsQuery from "../queries/postsQuery"
import {
  Box,
  Center,
  Text,
  Stack,
  Image,
  Avatar,
  useColorModeValue,
} from '@chakra-ui/react';

import IPost from "../interfaces/IPost"

export default function Post() {

  const { loading, error, data } = useQuery(postsQuery)

  if (loading) return <p>Loading...</p>
  if (error) return <p>Error :(</p>

  return data.posts.map(({ id, body, createdAt, user }: IPost) => (
    <Center py={6} key={id}>
      <Box
        w={'full'}
        bg={useColorModeValue('white', 'gray.900')}
        boxShadow={'2xl'}
        rounded={'md'}
        p={6}
        overflow={'hidden'}>
        <Stack mt={6} direction={'row'} spacing={4} align={'center'}>
          <Avatar
            src={'https://avatars0.githubusercontent.com/u/1164541?v=4'}
            alt={'Author'}
          />
          <Stack direction={'column'} spacing={0} fontSize={'sm'}>
            <Text fontWeight={600}>{user.fullName}</Text>
            <Text color={'gray.500'}>{createdAt}</Text>
          </Stack>
        </Stack>
        <Box
          bg={'gray.100'}
          mt={6}
          mx={0}
          mb={6}
          pos={'relative'}>
          <Image
            src={
              'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
            }
          />
        </Box>
        <Stack>
          <Text color={'gray.500'}>{body}</Text>
        </Stack>
      </Box>
    </Center>
  ))
}
