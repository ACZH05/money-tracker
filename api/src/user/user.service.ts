import { Injectable } from '@nestjs/common';
import { PrismaClient, User } from '../../generated/prisma/client.js';

const prisma = new PrismaClient();
@Injectable()
export class UserService {
  async findAll(): Promise<User[]> {
    return prisma.user.findMany();
  }
  async findOne(email: string): Promise<User | null> {
    return prisma.user.findUnique({
      where: { email },
    });
  }
}
