from django.urls import path
from .views import OrderListView, OrderDeleteView

app_name='order'
urlpatterns = [
    path('', OrderListView.as_view(), name='order-list'),
    path('<int:pk>/', OrderDeleteView.as_view(), name='order-delete'),
]
