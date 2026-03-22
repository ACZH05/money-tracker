import { createTransactionDto } from './dto/createTransaction.dto.js';
import { Body, Injectable } from '@nestjs/common';
import { Prisma, Transaction } from '../../generated/prisma/client.js';
import { prisma } from '../prisma/prisma.export.js';

@Injectable()
export class TransactionService {
  async findAll(): Promise<Transaction[]> {
    return prisma.transaction.findMany();
  }

  async createTransaction(
    dto: createTransactionDto,
    userId: number,
  ): Promise<Transaction> {
    const data: Prisma.TransactionCreateInput = {
      ...dto,
      user: {
        connect: { id: userId },
      },
    };
    return prisma.transaction.create({
      data,
    });
  }
}
