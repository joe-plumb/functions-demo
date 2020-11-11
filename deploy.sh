#!/bin/bash

RESOURCE_GROUP=functions-demo
RESOURCE_LOCATION=westeurope
EH_NAMESPACE=functions-demo-eh
EH_NAME=functions-demo-eh

echo Starting deploy script - Interactive Auth
az login
echo Creating resource group: $RESOURCE_GROUP
az group create -l $RESOURCE_LOCATION -n $RESOURCE_GROUP
echo Creating Event Hubs Namespace: $EH_NAMESPACE
az eventhubs namespace create --name $EH_NAMESPACE --resource-group $RESOURCE_GROUP -l $RESOURCE_LOCATION
echo Creating Event Hub: $EH_NAME
az eventhubs eventhub create --name $EH_NAME --resource-group $RESOURCE_GROUP --namespace-name $EH_NAMESPACE
echo Deployment complete!
echo ****
echo Creating write key
az eventhubs eventhub authorization-rule create --resource-group $RESOURCE_GROUP --namespace-name $EH_NAMESPACE --eventhub-name $EH_NAME --name SendRule --rights Send
echo Getting key
az eventhubs eventhub authorization-rule keys list --resource-group $RESOURCE_GROUP --namespace-name $EH_NAMESPACE --eventhub-name $EH_NAME --name SendRule | jq '.primaryConnectionString'
