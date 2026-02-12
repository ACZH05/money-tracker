import { Injectable } from "@nestjs/common";
import { PrismaClient, User } from "../../generated/prisma/client.js";

const prisma = new PrismaClient();
@Injectable()
export class UserService {
  async findAll(): Promise<User[]> {
    return prisma.user.findMany();
  }
}
