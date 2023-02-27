from django.contrib import admin
from django.urls import path, include

from rest_framework import routers
from trail_data.views import DataViewSet

router = routers.DefaultRouter()
router.register(r'', DataViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
    path('admin/', admin.site.urls),
]
