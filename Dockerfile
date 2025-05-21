FROM ubuntu:22.04

RUN mkdir -p /workspaces
COPY workspaces /workspaces
WORKDIR /workspaces
