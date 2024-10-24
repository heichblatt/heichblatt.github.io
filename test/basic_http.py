import os
import requests

BASE_URL = os.getenv("BASE_URL", "http://127.0.0.1:1313")

def test_http_functionality():
    response = requests.get(f"{BASE_URL}")
    assert response.status_code == 200
    assert "Hannes Eichblatt" in response.text
