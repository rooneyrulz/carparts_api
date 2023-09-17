from django.contrib import admin
from .models import Cart, CartItem

class CartItemInline(admin.TabularInline):
    model = CartItem
    extra = 0 

class CartAdmin(admin.ModelAdmin):
    inlines = [CartItemInline]

admin.site.register(Cart, CartAdmin)
