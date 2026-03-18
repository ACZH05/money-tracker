import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service.js';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('login')
  login(
    @Body('email') email: string,
    @Body('password') password: string,
  ): Promise<any> {
    return this.authService.login(email, password);
  }
}
