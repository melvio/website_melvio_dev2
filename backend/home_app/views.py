from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.views import APIView


class HomeView(APIView):
    def get(self, request):
        return HttpResponse("Hello, world.")
