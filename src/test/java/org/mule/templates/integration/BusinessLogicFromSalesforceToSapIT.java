/**
 * Mule Anypoint Template
 *
 * Copyright (c) MuleSoft, Inc.  All rights reserved.  http://www.mulesoft.com
 */

package org.mule.templates.integration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mule.MessageExchangePattern;
import org.mule.api.MuleEvent;
import org.mule.api.MuleException;
import org.mule.processor.chain.SubflowInterceptingChainLifecycleWrapper;

import com.mulesoft.module.batch.BatchTestHelper;
import com.sforce.soap.partner.SaveResult;

/**
 * The objective of this class is to validate the correct behavior of the flows
 * for this Anypoint Tempalte that make calls to external systems.
 * 
 */
public class BusinessLogicFromSalesforceToSapIT extends AbstractTemplateTestCase {
	protected static final String TEMPLATE_NAME = "customer-bidirectional-sync";
	protected static final int TIMEOUT_SEC = 120;
	private BatchTestHelper helper;
	private static final String A_INBOUND_FLOW_NAME = "triggerSyncFromSapFlow";
	private static final String B_INBOUND_FLOW_NAME = "triggerSyncFromSalesforceFlow";
	
	protected SubflowInterceptingChainLifecycleWrapper createAccountSapFlow;
	protected SubflowInterceptingChainLifecycleWrapper createAccountSalesforceFlow;
	protected SubflowInterceptingChainLifecycleWrapper deleteAccountFromSapFlow;
	protected SubflowInterceptingChainLifecycleWrapper retrieveAccountFromSalesforceFlow;
	protected SubflowInterceptingChainLifecycleWrapper retrieveAccountFromSapFlow;
	protected SubflowInterceptingChainLifecycleWrapper deleteAccountFromSalesforceFlow;
	
	private String existingCustomerNameInSap = "Nelson Tax & Associates";
	Map<String, Object> sfAccount;
	Map<String, Object> sapAccount;
	
	@BeforeClass
	public static void beforeTestClass() {
		// Set default water-mark expression to current time
		DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").withZone(DateTimeZone.UTC);
		System.setProperty("watermark.default.expression", formatter.print(System.currentTimeMillis() - 60000)); // one minute ago
	}
	
	@Before
	public void setUp() throws Exception {
		stopAutomaticPollTriggering();
		helper = new BatchTestHelper(muleContext);
		
		createAccountSapFlow = getSubFlow("createAccountSapFlow");
		createAccountSapFlow.initialise();

		createAccountSalesforceFlow = getSubFlow("createAccountSalesforceFlow");
		createAccountSalesforceFlow.initialise();
		
		deleteAccountFromSapFlow = getSubFlow("deleteAccountFromSapFlow");
		deleteAccountFromSapFlow.initialise();
		
		retrieveAccountFromSalesforceFlow = getSubFlow("retrieveAccountFromSalesforceFlow");
		retrieveAccountFromSalesforceFlow.initialise();

		retrieveAccountFromSapFlow = getSubFlow("retrieveAccountFromSapFlow");
		retrieveAccountFromSapFlow.initialise();
		
		deleteAccountFromSalesforceFlow = getSubFlow("deleteAccountFromSalesforceFlow");
		deleteAccountFromSalesforceFlow.initialise();
		
		//createSapTestData();
		createSalesforceTestData();
	}

	@After
	public void tearDown() throws MuleException, Exception {
		deleteSapTestData();
		deleteSalesforceTestData();
	}

	@Test
	public void testMainFlow() throws Exception {
		System.err.println("running flow");
		executeWaitAndAssertBatchJob(B_INBOUND_FLOW_NAME);
		
		Map<String, Object> sapResponse = (Map<String, Object>) retrieveAccountFromSapFlow.process(getTestEvent(sfAccount, MessageExchangePattern.REQUEST_RESPONSE)).getMessage().getPayload();
		System.err.println(sapResponse.getClass());
		System.err.println(sapResponse);
		Assert.assertEquals(sfAccount.get("Name"), sapResponse.get("Name"));
	}
	
	private void stopAutomaticPollTriggering() throws MuleException {
		stopFlowSchedulers(B_INBOUND_FLOW_NAME);
		stopFlowSchedulers(A_INBOUND_FLOW_NAME);
	}
	
	private void executeWaitAndAssertBatchJob(String flowConstructName)
			throws Exception {

		// Execute synchronization
		runSchedulersOnce(flowConstructName);

		// Wait for the batch job execution to finish
		helper.awaitJobTermination(TIMEOUT_SEC * 1000, 500);
		helper.assertJobWasSuccessful();
	}
	
	private void createSalesforceTestData() throws MuleException, Exception{
		String uniqueSuffix = ""+System.currentTimeMillis();
		sfAccount = new HashMap<String, Object>();
		sfAccount.put("Name", "Bidi_" + uniqueSuffix);
		sfAccount.put("BillingCity", "San francesco");
		List<Map<String, Object>> createdAccountInSalesforce = new ArrayList<Map<String, Object>>();
		createdAccountInSalesforce.add(sfAccount);
		MuleEvent event = createAccountSalesforceFlow.process(getTestEvent(createdAccountInSalesforce, MessageExchangePattern.REQUEST_RESPONSE));
		List<SaveResult> payloadAfterExecution = (List<SaveResult>)event.getMessage().getPayload();
		sfAccount.put("Id", payloadAfterExecution.get(0).getId());
		System.err.println("saved sf account " + payloadAfterExecution.get(0).getId());
	}
	
	private void createSapTestData() throws MuleException, Exception{
		String uniqueSuffix = ""+System.currentTimeMillis();
		
		sapAccount = new HashMap<String, Object>();
		sapAccount.put("Name", "Bidi" + uniqueSuffix);
		sapAccount.put("BillingCity", "San francesco");
		List<Map<String, Object>> createdAccountInSap = new ArrayList<Map<String, Object>>();
		createdAccountInSap.add(sapAccount);
	
		MuleEvent event = createAccountSapFlow.process(getTestEvent(createdAccountInSap, MessageExchangePattern.REQUEST_RESPONSE));
		System.err.println("SAP RESPONSE");
		System.err.println(event.getMessage().getPayload());
	}

	private void deleteSapTestData(){
		
	}

	private void deleteSalesforceTestData() throws MuleException, Exception{
		List<String> idList = new ArrayList<String>();
		idList.add((String)sfAccount.get("Id"));
		MuleEvent event = deleteAccountFromSalesforceFlow.process(getTestEvent(idList, MessageExchangePattern.REQUEST_RESPONSE));
	}

}
