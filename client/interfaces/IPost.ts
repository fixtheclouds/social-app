import IUser from "./IUser";

export default interface IPost {
  id: number
  title: string
  body: string
  createdAt: number
  user: IUser
}
