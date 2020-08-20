# Getting Started with Azure Functions
This repo contains documentation, artefacts, and code to give an overview of Azure Functions and covers core concepts in order to get started.

## Functions
`HTTPTrigger1` and `HTTPTrigger2` demonstrate out of the box functionality for HTTP triggers (1) and integration Event Hubs (2) using bindings. Ensure `local.settings.json` is created and populated with secrets to emulate locally, or App Settings are present in the Functions Service if deploying to Azure.

## Event Hub receiver
Event Hub subscriber to demonstrate incoming messages from `HTTPTrigger2` as part of the demo

## azfunctions-gettingstarted-public.pdf
Slides with brief overview of Azure Functions, where they fit and how to get started.

## deploy.sh
Bash script to deploy Event Hubs service, create and get a key for use in `HTTPTrigger2` as part of demo.
