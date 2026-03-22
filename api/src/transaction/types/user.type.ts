import { Request } from 'express';
import { JwtPayload } from 'src/auth/types/payload.type.js';

export interface RequestWithUser extends Request {
  user: JwtPayload;
}
