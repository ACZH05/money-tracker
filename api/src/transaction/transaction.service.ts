import { Injectable } from '@nestjs/common';
import { Transaction } from '../../generated/prisma/client.js';
import { prisma } from '../prisma/prisma.export.js';

@Injectable()
export class TransactionService {
  async findAll(): Promise<Transaction[]> {
    return prisma.transaction.findMany();
  }
}
