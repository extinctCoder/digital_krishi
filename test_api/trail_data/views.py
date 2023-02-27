from rest_framework import viewsets
from rest_framework import permissions
from .serializers import DataSerializer
from .models import Data


class DataViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Data.objects.all().order_by('-id')
    serializer_class = DataSerializer
    # permission_classes = [permissions.IsAuthenticated]
