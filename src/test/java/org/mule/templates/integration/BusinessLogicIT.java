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

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mule.MessageExchangePattern;
import org.mule.api.MuleEvent;
import org.mule.api.MuleException;
import org.mule.processor.chain.SubflowInterceptingChainLifecycleWrapper;

import com.mulesoft.module.batch.BatchTestHelper;

/**
 * The objective of this class is to validate the correct behavior of the flows
 * for this Anypoint Tempalte that make calls to external systems.
 * 
 */
public class BusinessLogicIT extends AbstractTemplateTestCase {
	protected static final String TEMPLATE_NAME = "customer-bidirectional-sync";
	protected static final int TIMEOUT_SEC = 120;
	private BatchTestHelper helper;
	
	protected SubflowInterceptingChainLifecycleWrapper createAccountSapFlow;
	protected SubflowInterceptingChainLifecycleWrapper deleteAccountFromSapFlow;
	protected SubflowInterceptingChainLifecycleWrapper retrieveAccountFromSalesforceFlow;
	protected SubflowInterceptingChainLifecycleWrapper deleteAccountFromSalesforceFlow;
	
	private String existingCustomerNameInSap = "Nelson Tax & Associates";
	Map<String, Object> sfAccount;
	
	@Before
	public void setUp() throws Exception {
		helper = new BatchTestHelper(muleContext);
		
		createAccountSapFlow = getSubFlow("createAccountSapFlow");
		createAccountSapFlow.initialise();
		
		deleteAccountFromSapFlow = getSubFlow("deleteAccountFromSapFlow");
		deleteAccountFromSapFlow.initialise();
		
		retrieveAccountFromSalesforceFlow = getSubFlow("retrieveAccountFromSalesforceFlow");
		retrieveAccountFromSalesforceFlow.initialise();
		
		deleteAccountFromSalesforceFlow = getSubFlow("deleteAccountFromSalesforceFlow");
		deleteAccountFromSalesforceFlow.initialise();
		
		createSapTestData();
	}

	@After
	public void tearDown() throws MuleException, Exception {
		deleteSapTestData();
		deleteSalesforceTestData();
	}

	@Test
	public void testMainFlow() throws Exception {
		runFlow("triggerFlow");
		
		// Wait for the batch job executed by the poll flow to finish
		helper.awaitJobTermination(TIMEOUT_SEC * 1000, 500);
		helper.assertJobWasSuccessful();
		
		Map<String, Object> payload = new HashMap<String, Object>();
		payload.put("Name", existingCustomerNameInSap);
		MuleEvent event = retrieveAccountFromSalesforceFlow.process(getTestEvent(payload, MessageExchangePattern.REQUEST_RESPONSE));
		sfAccount = (Map<String, Object>) event.getMessage().getPayload();
		Assert.assertNotNull(sfAccount);
		
		
	}
	
	private void createSapTestData() throws MuleException, Exception{
		String uniqueSuffix = "_" + TEMPLATE_NAME + "_" + System.currentTimeMillis();
		
		Map<String, Object> sapAccount3 = new HashMap<String, Object>();
		sapAccount3.put("Name", "Name_SAP" + uniqueSuffix);
		List<Map<String, Object>> createdAccountInSap = new ArrayList<Map<String, Object>>();
		createdAccountInSap.add(sapAccount3);
	
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
