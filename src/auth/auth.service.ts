import { UserService } from './../user/user.service.js';
import { Injectable, UnauthorizedException } from '@nestjs/common';

@Injectable()
export class AuthService {
  constructor(private userService: UserService) {}
  async login(email: string, password: string): Promise<any> {
    const user = await this.userService.findOne(email);
    if (user?.password !== password) {
      throw new UnauthorizedException('Invalid credentials');
    }

    return user;
  }
}
