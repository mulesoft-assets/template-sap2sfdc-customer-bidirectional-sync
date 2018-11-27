
# Anypoint Template: SAP and Salesforce Customer/Account Bi-Directional Sync	

<!-- Header (start) -->

<!-- Header (end) -->

# License Agreement
This template is subject to the conditions of the <a href="https://s3.amazonaws.com/templates-examples/AnypointTemplateLicense.pdf">MuleSoft License Agreement</a>. Review the terms of the license before downloading and using this template. You can use this template for free with the Mule Enterprise Edition, CloudHub, or as a trial in Anypoint Studio. 
# Use Case
<!-- Use Case (start) -->
Use this template if you would like to sync Customers from SAP to Salesforce Accounts in manner real-time synchronization using Polling.
The inbound SAP endpoint retrieves all Accounts in SAP using the custom BAPI **ZSDFM\_CUSTOMER\_GETLIST** and transforms them to Salesforce Accounts.
In the other direction, the synchronization is completed by polling Salesforce for Accounts and sending them to SAP using the standard IDoc DEBMAS01.
<!-- Use Case (end) -->

# Considerations
<!-- Default Considerations (start) -->

<!-- Default Considerations (end) -->

<!-- Considerations (start) -->
To make this template run, there are certain preconditions that must be considered.
All of them deal with the preparations in both SAP and Salesforce systems, that must be made for the template to run smoothly.
**Failing to do so could lead to unexpected behavior of the template.**

Before continue with the use of this template, you may want to check out this [Documentation Page](http://www.mulesoft.org/documentation/display/current/SAP+Connector#SAPConnector-EnablingYourStudioProjectforSAP), that will teach you how to work 
with SAP and Anypoint Studio-

## Disclaimer

This Anypoint template uses a few private Maven dependencies in oder to work. If you intend to run this template with Maven support, please continue reading.

You will find that there are two dependencies in the pom.xml file that begin with the group id - com.sap.conn:
	**com.sap.conn.jco** and  **com.sap.conn.idoc**
These dependencies are private for Mulesoft and will cause you application not to build from a Maven command line. You need to replace them with "provided" scope and copy the libraries into the build path.
<!-- Considerations (end) -->


## SAP Considerations

Here's what you need to know to get this template to work with SAP.

### As a Data Source

The SAP backend system is used as a source of data. The SAP connector is used to send and receive the data from the SAP backend. The connector can either use RFC calls of BAPI functions and/or IDoc messages for data exchange, and needs to be properly customized per the "Properties to Configure" section.

In order for this template to work, there are a few things that need to be done in SAP first.

1. RFC destination
of type "T = TCP/IP Connection" pointing to Program ID on gateway host needs to be created. The destination uses Unicode communication type with target system.

2. Program ID registration
RFC SDK is used to register Program ID on gateway host. Same Program ID name is used here as in the RFC destination.

3. Partner Profile
needs to be customized; type of Logical System as partner type. Message type DEBMAS is defined as Outbound and Inbound parameter. For Outbound parameter: As receiver port an RFC destination created earlier is used. IDoc Type DEBMAS01 is defined. For Inbound parameter: Process Code DEBM is used. IDoc Type DEBMAS01 is defined.

3. Partner Port
needs to be defined for type of IDoc record type of SAP release 4.x as its version. As RFC destination same RFC destination created earlier is used.

&nbsp;
&nbsp;
## Salesforce Considerations

Here's what you need to know about Salesforce to get this template to work:

- Where can I check that the field configuration for my Salesforce instance is the right one? See: <a href="https://help.salesforce.com/HTViewHelpDoc?id=checking_field_accessibility_for_a_particular_field.htm&language=en_US">Salesforce: Checking Field Accessibility for a Particular Field</a>.
- Can I modify the Field Access Settings? How? See: <a href="https://help.salesforce.com/HTViewHelpDoc?id=modifying_field_access_settings.htm&language=en_US">Salesforce: Modifying Field Access Settings</a>.

### As a Data Source

If the user who configured the template for the source system does not have at least *read only* permissions for the fields that are fetched, then an *InvalidFieldFault* API fault displays.

```
java.lang.RuntimeException: [InvalidFieldFault [ApiQueryFault 
[ApiFault  exceptionCode='INVALID_FIELD'
exceptionMessage='Account.Phone, Account.Rating, Account.RecordTypeId, 
Account.ShippingCity
^
ERROR at Row:1:Column:486
No such column 'RecordTypeId' on entity 'Account'. If you are attempting to 
use a custom field, be sure to append the '__c' after the custom field name. 
Reference your WSDL or the describe call for the appropriate names.'
]
row='1'
column='486'
]
]
```

### As a Data Destination

&nbsp;









# Run it!
Simple steps to get this template running.
<!-- Run it (start) -->

<!-- Run it (end) -->

## Running On Premises
In this section we help you run this template on your computer.
<!-- Running on premise (start) -->

<!-- Running on premise (end) -->

### Where to Download Anypoint Studio and the Mule Runtime
If you are new to Mule, download this software:

+ [Download Anypoint Studio](https://www.mulesoft.com/platform/studio)
+ [Download Mule runtime](https://www.mulesoft.com/lp/dl/mule-esb-enterprise)

**Note:** Anypoint Studio requires JDK 8.
<!-- Where to download (start) -->

<!-- Where to download (end) -->

### Importing a Template into Studio
In Studio, click the Exchange X icon in the upper left of the taskbar, log in with your Anypoint Platform credentials, search for the template, and click Open.
<!-- Importing into Studio (start) -->

<!-- Importing into Studio (end) -->

### Running on Studio
After you import your template into Anypoint Studio, follow these steps to run it:

+ Locate the properties file `mule.dev.properties`, in src/main/resources.
+ Complete all the properties required as per the examples in the "Properties to Configure" section.
+ Right click the template project folder.
+ Hover your mouse over `Run as`.
+ Click `Mule Application (configure)`.
+ Inside the dialog, select Environment and set the variable `mule.env` to the value `dev`.
+ Click `Run`.
<!-- Running on Studio (start) -->
In order to make this template run on Mule Studio there are a few extra steps that needs to be made.
Please check this Documentation Page:

+ [Enabling Your Studio Project for SAP](http://www.mulesoft.org/documentation/display/current/SAP+Connector#SAPConnector-EnablingYourStudioProjectforSAP)
<!-- Running on Studio (end) -->

### Running on Mule Standalone
Update the properties in one of the property files, for example in mule.prod.properties, and run your app with a corresponding environment variable. In this example, use `mule.env=prod`. 


## Running on CloudHub
When creating your application in CloudHub, go to Runtime Manager > Manage Application > Properties to set the environment variables listed in "Properties to Configure" as well as the mule.env value.
<!-- Running on Cloudhub (start) -->

<!-- Running on Cloudhub (end) -->

### Deploying a Template in CloudHub
In Studio, right click your project name in Package Explorer and select Anypoint Platform > Deploy on CloudHub.
<!-- Deploying on Cloudhub (start) -->

<!-- Deploying on Cloudhub (end) -->

## Properties to Configure
To use this template, configure properties such as credentials, configurations, etc.) in the properties file or in CloudHub from Runtime Manager > Manage Application > Properties. The sections that follow list example values.
### Application Configuration
<!-- Application Configuration (start) -->
+ polling.frequency `20000`
+ polling.start.delay `1000`
+ watermark.default.expression `2014-08-01T10:46:00.000Z`
+ watermark.default.expression.sap `2014-08-01T12:29:44Z`

+ page.size `100`

**SAP Connector Configuration**

+ sap.jco.ashost `your.sap.address.com`
+ sap.jco.user `SAP_USER`
+ sap.jco.passwd `SAP_PASS`
+ sap.jco.sysnr `14`
+ sap.jco.client `800`
+ sap.jco.lang `EN`

+ sap.default.accountGroup `ZAG2`

**SAP Endpoint Configuration**

+ sap.jco.connectioncount `2`
+ sap.jco.gwhost `your.sap.addres.com`
+ sap.jco.gwservice `sapgw14`
+ sap.jco.idoc.programid `PROGRAM_ID`

**SalesForce Connector Configuration**

+ sfdc.username `bob.dylan@sfdc`
+ sfdc.password `DylanPassword123`
+ sfdc.securityToken `avsfwCUl7apQs56Xq2AKi3X`
+ sfdc.url `https://test.salesforce.com/services/Soap/u/32.0`
+ sfdc.integration.user.id `00520000003LtvG`

	**Note:** To find out the correct *sfdc.integration.user.id* value, please, refer to example project **Salesforce Data Retrieval** in [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
<!-- Application Configuration (end) -->

# API Calls
<!-- API Calls (start) -->
SalesForce imposes limits on the number of API Calls that can be made.
Therefore calculating this amount may be an important factor to
consider. Customer migration template calls to the API can be
calculated using the formula:

**X / 200**

Being X the number of Accounts to be synchronized on each run.

The division by 200 is because, by default, Accounts are gathered in groups
of 200 for each Upsert API Call in the commit step. Also consider
that this calls are executed repeatedly every polling cycle.

For instance if 10 records are fetched from origin instance, then 1 api
calls to Salesforce will be made ( 1).
<!-- API Calls (end) -->

# Customize It!
This brief guide provides a high level understanding of how this template is built and how you can change it according to your needs. As Mule applications are based on XML files, this page describes the XML files used with this template. More files are available such as test classes and Mule application files, but to keep it simple, we focus on these XML files:

* config.xml
* businessLogic.xml
* endpoints.xml
* errorHandling.xml<!-- Customize it (start) -->

<!-- Customize it (end) -->

## config.xml
<!-- Default Config XML (start) -->
This file provides the configuration for connectors and configuration properties. Only change this file to make core changes to the connector processing logic. Otherwise, all parameters that can be modified should instead be in a properties file, which is the recommended place to make changes.<!-- Default Config XML (end) -->

<!-- Config XML (start) -->

<!-- Config XML (end) -->

## businessLogic.xml
<!-- Default Business Logic XML (start) -->
The functional aspect of the template is implemented on this XML, directed by two batch jobs that will be responsible for creations/updates of Customers and Accounts in both ways. The several message processors constitute four high level actions that fully implement the logic of this template:

1. Job executions are invoked from the trigger flows (endpoints.xml) everytime there is a new query executed asking for created/updated Customers or Accounts.
2. From SAP to Salesforce: during the Process stage, each SAP Customer will be mapped into an Salesforce Account and matched by name with the existent ones in the Salesforce instance. After that, the Account will be upserted to the Salesforce instance. 
3. From Salesforce to SAP: during the Process stage, all the information needed to upsert the Customer will be retrieved from the SAP instance, and then the original Account will be mapped into a SAP Customer to proceed with the upsert.
4. Finally during the On Complete stage, the template will unlock the processing for allowing the other direction to be executed.<!-- Default Business Logic XML (end) -->

<!-- Business Logic XML (start) -->

<!-- Business Logic XML (end) -->

## endpoints.xml
<!-- Default Endpoints XML (start) -->
This file contains the endpoints for triggering the template and for retrieving the objects that meet the defined criteria in a query. You can execute a batch job process with the query results.<!-- Default Endpoints XML (end) -->

<!-- Endpoints XML (start) -->

<!-- Endpoints XML (end) -->

## errorHandling.xml
<!-- Default Error Handling XML (start) -->
This file handles how your integration reacts depending on the different exceptions. This file provides error handling that is referenced by the main flow in the business logic.<!-- Default Error Handling XML (end) -->

<!-- Error Handling XML (start) -->

<!-- Error Handling XML (end) -->

<!-- Extras (start) -->

<!-- Extras (end) -->
