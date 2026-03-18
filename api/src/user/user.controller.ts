import { Body, Controller, Get, Post } from '@nestjs/common';
import { UserService } from './user.service.js';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  async getAllUsers() {
    return this.userService.findAll();
  }
  @Post()
  async getUserByEmail(@Body('email') email: string) {
    return this.userService.findOne(email);
  }
}
