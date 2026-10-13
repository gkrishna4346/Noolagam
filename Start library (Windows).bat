@echo off
title En Noolagam - My library
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0lib\server.ps1"
