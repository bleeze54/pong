import pygame
class Ball(pygame.sprite.Sprite):
    def __init__(self, game):
        super().__init__()
        self.game = game
        self.image = pygame.Surface((15, 15))
        self.image.fill((255, 255, 255))
        self.rect = self.image.get_rect()
        self.rect.center = (game.width // 2, game.height // 2)
        self.speed_x = 5
        self.speed_y = 5

    def update(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y

        if self.rect.left < 0 or self.rect.right > self.game.width:
            self.speed_x *= -1
        if self.rect.top < 0 or self.rect.bottom > self.game.height:
            self.speed_y *= -1

        if self.rect.colliderect(self.game.player1.rect):
            self.speed_x *= -1
