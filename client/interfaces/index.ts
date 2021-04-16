export interface IUser {
  id: number
  username: string
  fullName: string
  lastSignInAt?: number
  avatarUrl?: string
}

export interface IPost {
  id: number
  title: string
  body: string
  createdAt: number
  updatedAt: number
  user: IUser
  imageUrl?: string
  liked?: boolean
  likesCount?: number
}
