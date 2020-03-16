from django.shortcuts import render
from django.http import HttpResponse

def hello(request):
	html = "<html><body>Hello World</body></html>"
	return HttpResponse(html)

def goodbye_world(request):
	html = "<html><body>Goodbye World</body></html>"
	return HttpResponse(html)


