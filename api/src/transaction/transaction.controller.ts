import { Body, Controller, Get, Post, Request } from '@nestjs/common';
import { TransactionService } from './transaction.service.js';
import { createTransactionDto } from './dto/createTransaction.dto.js';
import type { RequestWithUser } from './types/user.type.js';

@Controller('transaction')
export class TransactionController {
  constructor(private readonly transactionService: TransactionService) {}

  @Get()
  async getAllTransaction() {
    return this.transactionService.findAll();
  }

  @Post()
  async createTransaction(
    @Body() dto: createTransactionDto,
    @Request() req: RequestWithUser,
  ) {
    return this.transactionService.createTransaction(dto, req.user.id);
  }
}
