# codepatterns 
Track data flow in C code applications using Clang, with an Angular based UI and Python based analysis modules.

## Frontend 

The app UI is a dashboard interface implemented using Angular and served over Nginx.

## Backend

The backend is a modular monolyth using Python to parse and process Clang generated ASTs and/or IRs.
The backend will produce use-case specific reports in formats that are interpretable for the UI-Frontend or integrated with a build toolchain.

Temporary data storing will use in-memory databases solutions only as data is not persisted over system reboots or multiple analysis sessions.

A microservices implementation can be developed if scaling and complexity prove problematic for the initial monolyth approach.
