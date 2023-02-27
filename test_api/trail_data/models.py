from django.db import models

# Create your models here.


class Data(models.Model):
    data = models.CharField(max_length=255)

    def __str__(self) -> str:
        return '{}'.format(self.data)
