{**
	* templates/payments/viewPayment.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2006-2009 Gunther Eysenbach, Juan Pablo Alperin, MJ Suhonos
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Page to view one CompletedPayment in detail
	*
	*}
	{strip}
	{assign var="pageTitle" value="common.payment"}
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

		{if $payment}

		<div id="payment">
			<div class="row">
				<div class="col-md-2" >
					<strong>
						{translate key="manager.payment.paymentId"}
					</strong>
				</div>
				<div class="col-md-5" >
					{$payment->getCompletedPaymentId()}
				</div>

			</div>

			<div class="row">
				<div class="col-md-2" >
					<strong>
						{translate key="user.username"}
					</strong>
				</div>
				<div class="col-md-5" >
					{assign var=user value=$userDao->getById($payment->getUserId())}
					{if $isJournalManager}
					<a class="action" href="{url op="userProfile" path=$payment->getUserId()}">{$user->getUsername()|escape|wordwrap:15:" ":true}</a>
					{else}
					{$user->getUsername()|escape|wordwrap:15:" ":true}
					{/if}
				</div>

			</div>

			<div class="row">
				<div class="col-md-2" >
					<strong>		

						{translate key="manager.payment.description"}
					</strong>
				</div>
				<div class="col-md-5" >
					{$payment->getName()|escape}
				</div>

			</div>

	<div class="row">
		<div class="col-md-2" >
		<strong>
			{translate key="manager.payment.timestamp"}
</strong>
</div>
<div class="col-md-5" >
			{$payment->getTimestamp()|escape}
</div>

</div>
	<div class="row">
		<div class="col-md-2" >
		<strong>
			{translate key="manager.payment.amount"}
</strong>
</div>
<div class="col-md-5" >
			{$payment->getAmount()|string_format:"%.2f"} ({$payment->getCurrencyCode()|escape})
</div>

</div>
	<div class="row">
		<div class="col-md-2" >
		<strong>

			{translate key="manager.payment.paymentMethod"}
</strong>
</div>
<div class="col-md-5" >
			{$payment->getPayMethodPluginName()|escape}
</div>

</div>

	<div class="row">
		<div class="col-md-2" >
		<strong>
			{translate key="manager.payment.details"}
</strong>
</div>
<div class="col-md-5" >
			{if $payment->getAssocDescription()}
			({$payment->getAssocId()|escape}) {$payment->getAssocDescription()|escape}

			{else}
			-
			{/if}

</div>

</div>

			{if $payment->isSubscription()}
			{assign var=subscriptionId value=$payment->getAssocId()}
			{if $individualSubscriptionDao->subscriptionExists($subscriptionId)}
	<div class="row">
		<div class="col-md-4" >
		<strong>

			<a class="action" href="{url op="editSubscription" path="individual"|to_array:$subscriptionId}">{translate key="manager.payment.editSubscription"}</a>
</div>

</div>

			{elseif $institutionalSubscriptionDao->subscriptionExists($subscriptionId)}
	<div class="row">
		<div class="col-md-4" >
		<strong>

			<a class="action" href="{url op="editSubscription" path="institutional"|to_array:$subscriptionId}">{translate key="manager.payment.editSubscription"}</a>
</div>

</div>

			{/if}
			{/if}


		</div>

	{else}
	{translate key="manager.payment.paymentId"} {translate key="manager.payment.notFound"}
	{/if}
	<p><input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="manager" op="viewPayments" escape=false}'" /></p>
	{include file="common/footer.tpl"}

