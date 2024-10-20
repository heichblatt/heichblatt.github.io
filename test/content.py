import os
import pytest
import re
import requests

BASE_URL = os.getenv("BASE_URL", "http://127.0.0.1:1313")
TIMEOUT = (60, 60)  # (connect_timeout, read_timeout)


def test_content_homepage():
    response = requests.get(BASE_URL, timeout=TIMEOUT)
    assert "rss" in response.text
    assert 'href="/about/"' in response.text


def test_content_pages_about():
    response = requests.get(f"{BASE_URL}/about/", timeout=TIMEOUT)
    assert re.search(r"<h2.*>Bio.*</h2>", response.text)
    assert re.search(r"<h2.*>Contact.*</h2>", response.text)


def test_content_extras_keybase():
    response = requests.get(f"{BASE_URL}/keybase.txt", timeout=TIMEOUT)
    assert "I am an admin of https://hanneseichblatt.de" in response.text
    assert "https://keybase.io/heichblatt" in response.text


def test_content_extras_pgp_keys():
    response = requests.get(f"{BASE_URL}/pgp_keys.asc", timeout=TIMEOUT)
    assert "-----BEGIN PGP PUBLIC KEY BLOCK-----" in response.text


def test_content_rss():
    response = requests.get(f"{BASE_URL}/index.xml", timeout=TIMEOUT)
    assert re.search(r"<link>https?://.*/</link>", response.text)
    assert '<?xml version="1.0" encoding="utf-8" standalone="yes"?>' in response.text
    assert (
        '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">' in response.text
    )
    assert "<title>hanneseichblatt.de</title>" in response.text
    assert "<generator>Hugo" in response.text
    assert "<item>" in response.text
    assert "</rss>" in response.text


def test_content_no_exposure():
    for file in ["Pipfile", "Makefile", "test/content.py"]:
        response = requests.get(f"{BASE_URL}/{file}", timeout=TIMEOUT)
        assert response.status_code == 404
