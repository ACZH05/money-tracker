import { Injectable } from '@nestjs/common';
import { User } from '../../generated/prisma/client.js';
import { prisma } from '../prisma/prisma.export.js';

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
