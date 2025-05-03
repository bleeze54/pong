import pygame

class Player(pygame.sprite.Sprite):

    def limite(self,n):
        if self.rect.y+n < self.game.height-90 and self.rect.y+n > -5:
            self.rect.y += n
            return
        
    def __init__(self, game,playerName):
        super().__init__()
        self.PlayerName = playerName
        self.game = game
        self.image = pygame.Surface((15, 100))
        self.rect = self.image.get_rect()
        if playerName == "player1":
            self.rect.center = (game.width // 2, game.height // 2)
            self.image.fill((10, 255, 10))
            self.rect.x ,self.rect.y = 20,20
        else:
            self.rect.center = (game.width // 2, game.height // 2)
            self.image.fill((255, 10,10))
            self.rect.x ,self.rect.y = 15,0

    def update(self):
        self.rect.x =self.rect.x
        self.rect.y =self.rect.y
        keys = pygame.key.get_pressed()
        if self.PlayerName == "player1":
            if keys[pygame.K_z]:
                self.limite(-5)
            if keys[pygame.K_s]:
                self.limite(5)
        else:
            if keys[pygame.K_UP]:
                self.limite(-5)
            if keys[pygame.K_DOWN]:
                self.limite(5)