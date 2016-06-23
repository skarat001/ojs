{**
 * templates/subscription/subscriptionTypes.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of subscription types in journal management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.subscriptionTypes"}
{assign var="pageId" value="manager.subscriptionTypes"}
{include file="common/header.tpl"}
{/strip}
<script type="text/javascript">
{literal}
$(document).ready(function() { setupTableDND("#subscriptionTypesTable", "moveSubscriptionType"); });
{/literal}
</script>

	<ul class="nav nav-pills navsubs">
		<li class="nav-item "><a href="{url op="subscriptionsSummary"}" class="nav-link">{translate key="manager.subscriptions.summary"}</a></li>
		<li class="nav-item "><a href="{url op="subscriptions" path="individual"}" class="nav-link">{translate key="manager.individualSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptions" path="institutional"}" class="nav-link">{translate key="manager.institutionalSubscriptions"}</a></li>
		<li class="nav-item active"><a href="{url op="subscriptionTypes" }" class="nav-link">{translate key="manager.subscriptionTypes"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionPolicies" }" class="nav-link">{translate key="manager.subscriptionPolicies"}</a></li>
		<li class="nav-item"><a href="{url op="payments" }" class="nav-link">{translate key="manager.payments"}</a></li>
	</ul>
	<hr>

<div id="subscriptionTypes">

<a href="{url op="createSubscriptionType"}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> {translate key="manager.subscriptionTypes.create"}</a>
</div>
<br/>
<table width="100%" class="table table-striped" id="subscriptionTypesTable">
<thead>

	<tr class="heading" valign="bottom">
		<th width="40%">{translate key="manager.subscriptionTypes.name"}</th>
		<th width="10%">{translate key="manager.subscriptionTypes.subscriptions"}</th>
		<th width="20%">{translate key="manager.subscriptionTypes.duration"}</th>
		<th width="15%">{translate key="manager.subscriptionTypes.cost"}</th>
		<th width="15%">{translate key="common.action"}</th>
	</tr>
	</thead>
<tbody>
{iterate from=subscriptionTypes item=subscriptionType}
	<tr valign="top" id="subtype-{$subscriptionType->getTypeId()}" class="data">
		<td class="drag">{$subscriptionType->getSubscriptionTypeName()|escape}</td>
		<td class="drag">{if $subscriptionType->getInstitutional()}{translate key="manager.subscriptionTypes.institutional"}{else}{translate key="manager.subscriptionTypes.individual"}{/if}</td>
		<td class="drag">{$subscriptionType->getDurationYearsMonths()|escape}</td>
		<td class="drag">{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()})</td>
		<td><a href="{url op="moveSubscriptionType" id=$subscriptionType->getTypeId() dir=u}" class="action">&uarr;</a>&nbsp;<a href="{url op="moveSubscriptionType" id=$subscriptionType->getTypeId() dir=d}" class="action">&darr;</a>&nbsp;|&nbsp;<a href="{url op="editSubscriptionType" path=$subscriptionType->getTypeId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteSubscriptionType" path=$subscriptionType->getTypeId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.subscriptionTypes.confirmDelete"}')" class="action">{translate key="common.delete"}</a></td>
	</tr>
  {if $subscriptionTypes->eof()}
  
  {/if}
{/iterate}
{if $subscriptionTypes->wasEmpty()}
	<tr>
		<td colspan="5" class="nodata">{translate key="manager.subscriptionTypes.noneCreated"}</td>
	</tr>
	
{else}
	<tr>
		<td align="left">{page_info iterator=$subscriptionTypes}</td>
		<td colspan="2" align="right">{page_links anchor="subscriptionTypes" name="subscriptionTypes" iterator=$subscriptionTypes}</td>
	</tr>
{/if}
</tbody>
</table>


{include file="common/footer.tpl"}

