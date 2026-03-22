import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service.js';
import { Public } from './decorators/public.decorator.js';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Public()
  @Post('login')
  login(
    @Body('email') email: string,
    @Body('password') password: string,
  ): Promise<any> {
    return this.authService.login(email, password);
  }
}
