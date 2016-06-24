{**
	* templates/subscription/individualSubscriptions.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Display list of individual subscriptions in journal management.
	*
	*}
	{strip}
	{assign var="pageTitle" value="manager.individualSubscriptions"}
	{assign var="pageId" value="manager.individualSubscriptions"}
	{include file="common/header.tpl"}
	{/strip}
	<ul class="nav nav-pills navsubs">
		<li class="nav-item "><a href="{url op="subscriptionsSummary"}" class="nav-link">{translate key="manager.subscriptions.summary"}</a></li>
		<li class="nav-item active"><a href="{url op="subscriptions" path="individual"}" class="nav-link">{translate key="manager.individualSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptions" path="institutional"}" class="nav-link">{translate key="manager.institutionalSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionTypes" }" class="nav-link">{translate key="manager.subscriptionTypes"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionPolicies" }" class="nav-link">{translate key="manager.subscriptionPolicies"}</a></li>
		<li class="nav-item"><a href="{url op="payments" }" class="nav-link">{translate key="manager.payments"}</a></li>
	</ul>
	<hr>

	<form action="#" class="form-horizontal">
		<div class="form-group">
			<div class="col-md-3 control-label pull-left">
				{translate key="manager.subscriptions.withStatus"}
			</div>
			<div class="col-md-3">
				<select name="filterStatus" onchange="location.href='{url|escape:"javascript" path="individual" searchField=$searchField searchMatch=$searchMatch search=$search dateSearchField=$dateSearchField dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth filterStatus="STATUS_ID" escape=false}'.replace('STATUS_ID', this.options[this.selectedIndex].value)" size="1" class="form-control">{html_options_translate options=$statusOptions selected=$filterStatus}</select>
			</div>
		</div>
	</form>

	{if !$dateFrom}
	{assign var="dateFrom" value="--"}
	{/if}

	{if !$dateTo}
	{assign var="dateTo" value="--"}
	{/if}

	<form method="post" id="submit" action="{url op="subscriptions" path="individual"} class="form-horizontal" ">
		<div class="form-group">
			<div class="col-md-3">
				<select name="searchField" size="1" class="form-control">
					{html_options_translate options=$fieldOptions selected=$searchField}
				</select>
			</div>
			<div class="col-md-3">
				<select name="searchMatch" size="1" class="form-control">
					<option value="contains"{if $searchMatch == 'contains'} selected="selected"{/if}>{translate key="form.contains"}</option>
					<option value="is"{if $searchMatch == 'is'} selected="selected"{/if}>{translate key="form.is"}</option>
					<option value="startsWith"{if $searchMatch == 'startsWith'} selected="selected"{/if}>{translate key="form.startsWith"}</option>
				</select>
			</div>
			<div class="col-md-4">
				<input type="text" size="15" name="search" class="form-control" value="{$search|escape}" />
			</div>
		</div>
<br/>
		<div class="form-group">
			<div class="col-md-3">
				<select name="dateSearchField" size="1" class="form-control">
					{html_options_translate options=$dateFieldOptions selected=$dateSearchField}
				</select>
			</div>
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-12">
					<div class="col-md-2">
						{translate key="common.between"}
						</div>
						{html_select_date prefix="dateFrom" time=$dateFrom all_extra="class=\"selectMenu\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+5"}

					</div>
					<br/>
					<div class="col-md-12">
					<div class="col-md-2">
						{translate key="common.and"}
						</div>
						{html_select_date prefix="dateTo" time=$dateTo all_extra="class=\"selectMenu\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+5"}
					</div>
				</div>
				<input type="hidden" name="dateToHour" value="23" />
				<input type="hidden" name="dateToMinute" value="59" />
				<input type="hidden" name="dateToSecond" value="59" />
			</div>
		</div>
		<br/>
		<div class="form-group">
		<div class="col-md-6 col-md-offset-1">
		<input type="submit" value="{translate key="common.search"}" class="btn btn-primary" />

		</div>
		</div>
	</form>

	<br />
<br/>
	<div id="subscriptions">

		<table width="100%" class="table table-striped">
		<thead>
			<tr class="heading" valign="bottom">
				<th width="30%">{translate key="manager.subscriptions.user"}</th>
				<th width="25%">{translate key="manager.subscriptions.subscriptionType"}</th>
				<th width="10%">{translate key="subscriptions.status"}</th>
				<th width="10%">{translate key="manager.subscriptions.dateStart"}</th>
				<th width="10%">{translate key="manager.subscriptions.dateEnd"}</th>
				<th width="15%">{translate key="common.action"}</th>
			</tr>
			</thead>
			<tbody>
			{iterate from=subscriptions item=subscription}
			{assign var=isNonExpiring value=$subscription->isNonExpiring()}
			<tr valign="top">
				<td>
					{assign var=emailString value=$subscription->getUserFullName()|concat:" <":$subscription->getUserEmail():">"}
					{url|assign:"redirectUrl" op="subscriptions" path="individual" escape=false}
					{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$redirectUrl}
					{$subscription->getUserFullName()|escape}&nbsp;{icon name="mail" url=$url}
				</td>
				<td>{$subscription->getSubscriptionTypeName()|escape}</td>
				<td>{$subscription->getStatusString()|escape}</td>
				<td>{if $isNonExpiring}&nbsp;{else}{if $subscription->isExpired()}<span class="disabled">{$subscription->getDateStart()|date_format:$dateFormatShort}</span>{else}{$subscription->getDateStart()|date_format:$dateFormatShort}{/if}{/if}</td>
				<td>{if $isNonExpiring}{translate key="subscriptionTypes.nonExpiring"}{else}{if $subscription->isExpired()}<span class="disabled">{$subscription->getDateEnd()|date_format:$dateFormatShort}</span>{else}{$subscription->getDateEnd()|date_format:$dateFormatShort}{/if}{/if}</td>
				<td><a href="{url op="editSubscription" path="individual"|to_array:$subscription->getId()}" class="action">{translate key="common.edit"}</a>{if !$isNonExpiring}&nbsp;|&nbsp;<a href="{url op="renewSubscription" path="individual"|to_array:$subscription->getId()}" class="action">{translate key="manager.subscriptions.renew"}</a>{/if}&nbsp;|&nbsp;<a href="{url op="deleteSubscription" path="individual"|to_array:$subscription->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.subscriptions.confirmDelete"}')" class="action">{translate key="common.delete"}</a></td>
			</tr>
			
			{/iterate}
			{if $subscriptions->wasEmpty()}
			<tr>
				<td colspan="6" class="nodata">{translate key="manager.subscriptions.noneCreated"}</td>
			</tr>
		
			{else}
			<tr>
				<td colspan="2" align="left">{page_info iterator=$subscriptions}</td>
				<td colspan="4" align="right">{page_links anchor="subscriptions" name="subscriptions" iterator=$subscriptions searchField=$searchField searchMatch=$searchMatch search=$search dateSearchField=$dateSearchField dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth filterStatus=$filterStatus}</td>
			</tr>
			{/if}
			</tbody>
		</table>
	
	</div>

	{include file="common/footer.tpl"}

