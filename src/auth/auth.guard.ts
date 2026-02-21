import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}
  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request: Request = await context.switchToHttp().getRequest();
    const authHeader = this.extractToken(request.headers['authorization']);
    if (!authHeader) {
      console.log('AuthGuard: No token found in Authorization header');
      throw new UnauthorizedException();
    }

    try {
      await this.jwtService.verifyAsync(authHeader);
    } catch {
      throw new UnauthorizedException('Invalid token');
    }
    return true;
  }

  private extractToken(authHeader: string | undefined): string | null {
    if (!authHeader) return null;
    const [type, token] = authHeader.split(' ');
    if (type !== 'Bearer' || !token) return null;
    return token;
  }
}
