import { Controller, Get } from '@nestjs/common';
import { TransactionService } from './transaction.service.js';

@Controller('transaction')
export class TransactionController {
  constructor(private readonly transactionService: TransactionService) {}

  @Get()
  async getAllTransaction() {
    return this.transactionService.findAll();
  }
}
