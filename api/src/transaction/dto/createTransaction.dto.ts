import { ApiProperty } from '@nestjs/swagger';

export class createTransactionDto {
  @ApiProperty()
  amount!: number;

  @ApiProperty()
  category!: string;

  @ApiProperty()
  timestamp!: Date;
}
