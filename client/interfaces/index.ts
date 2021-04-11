export interface IUser {
  id: number
  username: string
  fullName: string
  lastSignInAt?: number
}

export interface IPost {
  id: number
  title: string
  body: string
  createdAt: number
  updatedAt: number
  user: IUser
}
