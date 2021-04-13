import * as React from 'react';
import { IPost } from "../interfaces"
import {
  Box,
  Center,
  Text,
  Stack,
  Image,
  Avatar,
  useColorModeValue,
} from '@chakra-ui/react';

export default function Post(props: IPost) {
  const { id, body, createdAt, user, imageUrl } = props;

  return (
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
        <Box bg={'gray.100'} mt={6} mx={0} mb={6} pos={'relative'}>
          {imageUrl && <Image src={imageUrl} />}
        </Box>
        <Stack>
          <Text color={'gray.500'}>{body}</Text>
        </Stack>
      </Box>
    </Center>
  )
}
