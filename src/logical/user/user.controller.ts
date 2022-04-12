import { Body, Controller, Post } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly usersService: UserService) {}

  // @Post('find-one')
  // findOne(@Body() body: any) {
  //   return this.usersService.findOne(body.username);
  // }
  @Post('register')
  async register(@Body() body: any) {
    return await this.usersService.register(body);
  }
}
