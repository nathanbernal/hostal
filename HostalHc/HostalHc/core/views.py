from django.shortcuts import render, HttpResponse

# Create your views here.


def Index(request):
	return render(request, "core/Index.html")

def Formulario(request):
	return render(request, "core/Formulario.html")

def portfolio(request):
	return render(request, "core/portfolio.html")

def contact(request):
	return render(request, "core/contact.html")