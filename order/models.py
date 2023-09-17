from django.db import models
from django.contrib.auth.models import User
from cart.models import CartItem

class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # You may need to import the User model
    cart_items = models.ManyToManyField(CartItem)
    order_date = models.DateTimeField(auto_now_add=True)
    delivery_date = models.DateTimeField()

    def __str__(self):
        return f"Order #{self.id}"
    
