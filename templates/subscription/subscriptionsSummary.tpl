{**
	* templates/subscription/subscriptionsSummary.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Display summary subscriptions page in journal management.
	*
	*}
	{strip}
	{assign var="pageTitle" value="manager.subscriptions.summary"}
	{assign var="pageId" value="manager.subscriptions.summary"}
	{include file="common/header.tpl"}
	{/strip}

	<ul class="nav nav-pills navsubs">
		<li class="nav-item active"><a href="{url op="subscriptionsSummary"}" class="nav-link">{translate key="manager.subscriptions.summary"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptions" path="individual"}" class="nav-link">{translate key="manager.individualSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptions" path="institutional"}" class="nav-link">{translate key="manager.institutionalSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionTypes" }" class="nav-link">{translate key="manager.subscriptionTypes"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionPolicies" }" class="nav-link">{translate key="manager.subscriptionPolicies"}</a></li>
		<li class="nav-item"><a href="{url op="payments" }" class="nav-link">{translate key="manager.payments"}</a></li>
	</ul>
	<hr>




<div class="row">

	<div class="col-md-6">
		<div class="panel panel-info">
			<div class="panel-heading">
					<h3>{translate key="manager.individualSubscriptions"}</h3>
			</div>
			<div class="panel-body fixed-panel">

			{foreach name=allStatus from=$individualStatus key=statusIndex 	item=status}
			<div class="row">
			<div class="col-md-10">
	<a href="{url op="subscriptions" path="individual" filterStatus=$status.status}">{translate key=$status.localeKey}</a> 
	</div>
<div class="col-md-2">
	<strong>{$status.count}</strong>
	</div>
	</div>
		{/foreach}
		<br/>
			<a href="{url op="selectSubscriber" path="individual"}" class="btn btn-success"><i class="fa fa-plus" ></i> {translate key="manager.subscriptions.create"}</a>

			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="panel panel-info">
			<div class="panel-heading">
						<h3>{translate key="manager.institutionalSubscriptions"}</h3>
			</div>
			<div class="panel-body fixed-panel">

			{foreach name=allStatus from=$individualStatus key=statusIndex 	item=status}
			<div class="row">
			<div class="col-md-10">
	<a href="{url op="subscriptions" path="institutional" filterStatus=$status.status}">{translate key=$status.localeKey}</a> 
	</div>
<div class="col-md-2">
	<strong>{$status.count}</strong>
	</div>
	</div>
		{/foreach}
		<br/>
			<a href="{url op="selectSubscriber" path="institutional"}" class="btn btn-success"><i class="fa fa-plus" ></i>  {translate key="manager.subscriptions.create"}</a>

			</div>
		</div>
	</div>

</div>

	
	{include file="common/footer.tpl"}

