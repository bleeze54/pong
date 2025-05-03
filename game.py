import pygame
from balll import Ball
from player import Player
class Game:
    def __init__(self):
        self.width = 800
        self.height = 600
        self.window = pygame.display.set_mode((self.width, self.height))
        pygame.display.set_caption("Pong")
        self.running = True
        self.clock = pygame.time.Clock()
        self.background_color = (0, 0, 0)
        self.ball = Ball(self)
        self.player1 = Player(self,"player1")

    def draw(self):
        self.window.fill(self.background_color)
        self.clock.tick(60)
        self.window.blit(self.player1.image, self.player1.rect)
        self.player1.update()
        self.ball.update()
        self.window.blit(self.ball.image, self.ball.rect)
        pygame.display.flip()

    def run(self):
        while self.running:
            self.draw()
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
        pygame.quit()