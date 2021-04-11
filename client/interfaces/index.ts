export interface IUser {
  id: number
  username: string
  fullName: string
}

export interface IPost {
  id: number
  title: string
  body: string
  createdAt: number
  user: IUser
}
