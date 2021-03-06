{**
 * templates/payments/viewPayments.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2006-2009 Gunther Eysenbach, Juan Pablo Alperin, MJ Suhonos
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Table to view all past CompletedPayments
 *
 *}
{strip}
{assign var="pageTitle" value="common.payments"}
{include file="common/header.tpl"}
{/strip}

		<ul class="menu">
			<ul class="nav nav-pills ">
				<li class="nav-item "><a href="{url op="payments"}" class="nav-link">{translate key="manager.payment.options"}</a></li>
				<li class="nav-item "><a href="{url op="payMethodSettings"}" class="nav-link">{translate key="manager.payment.paymentMethods"}</a></li>
				<li class="nav-item active"><a href="{url op="viewPayments"}" class="nav-link">{translate key="manager.payment.records"}</a></li>

			</ul>
			<hr>
<br />

<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th width="25%">{translate key="common.user"}</th>
		<th width="25%">{translate key="manager.payment.paymentType"}</th>
		<th width="25%">{translate key="manager.payment.timestamp"}</th>
		<th width="25%">{translate key="manager.payment.action"}</th>
	</tr>
</thead>
<tbody>
	{iterate from=payments item=payment}
	{assign var=isSubscription value=$payment->isSubscription()}
	{if $isSubscription}
		{assign var=subscriptionId value=$payment->getAssocId()}
		{if $individualSubscriptionDao->subscriptionExists($subscriptionId)}
			{assign var=isIndividual value=true}
		{elseif $institutionalSubscriptionDao->subscriptionExists($subscriptionId)}
			{assign var=isInstitutional value=true}
		{else}
			{assign var=isIndividual value=false}
			{assign var=isInstitutional value=false}
		{/if}
	{/if}
	<tr valign="top">
		<td>
			{assign var=user value=$userDao->getById($payment->getUserId())}
			{if $isJournalManager}
				<a class="action" href="{url op="userProfile" path=$payment->getUserId()}">{$user->getUsername()|escape|wordwrap:15:" ":true}</a>
			{else}
				{$user->getUsername()|escape|wordwrap:15:" ":true}
			{/if}
		</td>
		<td>
			{if $isSubscription}
				{if $isIndividual}
					<a href="{url op="editSubscription" path="individual"|to_array:$subscriptionId}">{$payment->getName()|escape}</a>
				{elseif $isInstitutional}
					<a href="{url op="editSubscription" path="institutional"|to_array:$subscriptionId}">{$payment->getName()|escape}</a>
				{else}
					{$payment->getName()|escape}
				{/if}
			{else}
				{$payment->getName()|escape}
			{/if}
		</td>
		<td class="nowrap">
		{$payment->getTimestamp()|escape}
		</td>
		<td>
			<a href="{url op="viewPayment" path=$payment->getPaymentId()}" class="action">{translate key="manager.payment.details"}</a>
		</td>
	</tr>
	
	{/iterate}
{if $payments->wasEmpty()}
	<tr>
		<td colspan="4" class="nodata">{translate key="manager.payment.noPayments"}</td>
	</tr>

{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$payments}</td>
		<td align="right">{page_links anchor="payments" name="payments" iterator=$payments}</td>
	</tr>
{/if}
</tbody>
</table>

{include file="common/footer.tpl"}
