
from django.urls import path
from .views import CartItemListCreate, CartItemDelete

app_name = 'cart'
urlpatterns = [
    path('cart-items/', CartItemListCreate.as_view(), name='cartitem-list-create'),
    path('cart-items/<int:pk>/', CartItemDelete.as_view(), name='cartitem-delete'),
]