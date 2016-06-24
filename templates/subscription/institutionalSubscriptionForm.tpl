{**
	* templates/subscription/institutionalSubscriptionForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Individual subscription form under journal management.
	*
	*}
	{strip}
	{assign var="pageCrumbTitle" value="$subscriptionTitle"}
	{if $subscriptionId}
	{assign var="pageTitle" value="manager.subscriptions.edit"}
	{url|assign:"currentUrl" op="editSubscription" path="institutional"|to_array:$subscriptionId userId=$userId}
	{else}
	{assign var="pageTitle" value="manager.subscriptions.create"}
	{url|assign:"currentUrl" op="createSubscription" path="institutional" userId=$userId}
	{/if}
	{assign var="pageId" value="manager.subscriptions.institutionalSubscriptionForm"}
	{include file="common/header.tpl"}
	{/strip}

	<br/>

	<form method="post" id="subscriptionForm" action="{url op="updateSubscription" path="institutional"}" class="form-horizontal">
		{if $subscriptionId}
		<input type="hidden" name="subscriptionId" value="{$subscriptionId|escape}" />
		{/if}

		{include file="common/formErrors.tpl"}

		<table class="data" width="100%">
			{if count($formLocales) > 1}
			<tr valign="top">
				<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
				<td width="80%" class="value">
					{if $subscriptionId}
					{url|assign:"formUrl" op="editSubscription" path="institutional"|to_array:$subscriptionId userId=$userId escape=false}
					{else}
					{url|assign:"formUrl" op="createSubscription" path="institutional" escape=false}
					{/if}
					{form_language_chooser form="subscriptionForm" url=$formUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>
				</td>
			</tr>
			{/if}

			{include file="subscription/subscriptionForm.tpl"}

			{* For new subscriptions, set end date for default subscription type *}
			{if !$subscriptionId && !$ipRanges}
			<script type="text/javascript">
				<!--
				chooseEndDate();
	// -->
</script>
{/if}
</table>

<br />
<div class="separator"></div>
<br />

<div class="form-group">
	<div class="col-md-3 control-label">
		{fieldLabel name="institutionName" required="true" key="manager.subscriptions.form.institutionName"}
	</div>
	<div class="col-md-7">
		<input type="text" name="institutionName" id="institutionName" value="{if $institutionName}{$institutionName|escape}{/if}" size="30" maxlength="90" class="form-control" />
	</div>
</div>
<div class="form-group">
	<div class="col-md-3 control-label">
		{fieldLabel name="institutionMailingAddress" key="manager.subscriptions.form.institutionMailingAddress"}
	</div>
	<div class="col-md-7">
		<textarea name="institutionMailingAddress" id="institutionMailingAddress" rows="3" cols="40" class="textArea">{$institutionMailingAddress|escape}</textarea>
	</div>
</div>
<div class="form-group">
	<div class="col-md-3 control-label">
		{fieldLabel name="domain" key="manager.subscriptions.form.domain"}
	</div>
	<div class="col-md-7">
		<input type="text" name="domain" id="domain" value="{if $domain}{$domain|escape}{/if}" size="30" maxlength="90" class="form-control" />
	</div>
</div>

<div class="form-group">
	<div class="col-md-3">
	</div>
	<div class="col-md-7">
		<span class="instruct">{translate key="manager.subscriptions.form.domainInstructions"}</span></td>
	</tr>
</div>
</div>

<table class="table table-striped" width="100%">
	{foreach name=ipRanges from=$ipRanges key=ipRangeIndex item=ipRange}
	<tr valign="top">
		{if $ipRangeIndex == 0}
		<td width="15%" ><p>{translate key="manager.subscriptions.form.ipRange"}</p></td>
		{else}
		<td width="15%">&nbsp;</td>
		{/if}
		<td width="5%" ><p>{translate key="manager.subscriptions.form.ipRangeItem}</p></td>
		<td width="60%">
<div class="input-group col-md">
		<input type="text" name="ipRanges[{$ipRangeIndex|escape}]" id="ipRanges-{$ipRangeIndex|escape}" value="{$ipRange|escape}" size="30" maxlength="40" class="form-control" />
			{if $smarty.foreach.ipRanges.total > 1}
			  <span class="input-group-btn">
			<input type="submit" name="delIpRange[{$ipRangeIndex|escape}]" value="{translate key="manager.subscriptions.form.deleteIpRange"}" class="btn btn-warning" />
			</span>  </div> </td>
			{else}
</div>
		</td>
		{/if}
		
	</tr>
	{foreachelse}
	<tr valign="top">
		<td width="15%" ><p>{translate key="manager.subscriptions.form.ipRange"}</p></td>
		<td width="5%"><p>{translate key="manager.subscriptions.form.ipRangeItem}</p></td>
		<td width="80%" class="value"><input type="text" name="ipRanges[0]" id="ipRanges-0" size="30" maxlength="40" class="form-control" /></td>
	</tr>
	{/foreach}
	<tr valign="top">
		<td width="15%">&nbsp;</td>
		<td width="5%">&nbsp;</td>
		<td width="80%"><input type="submit" class="btn btn-default" name="addIpRange" value="{translate key="manager.subscriptions.form.addIpRange"}" /></td>
	</tr>
	
</table>
<div class="row">
<small>{translate key="manager.subscriptions.form.ipRangeInstructions"}</small>
</div>
<div class="separator"></div>
<br />

<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="userId" required="true" key="manager.subscriptions.form.userContact"}</td>
		<td width="80%" class="value">
			{assign var=emailString value="$userFullName <$userEmail>"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl}
			{$username|escape}&nbsp;&nbsp;{icon name="mail" url=$url}&nbsp;&nbsp;<a href="{if $subscriptionId}{url op="selectSubscriber" path="institutional" subscriptionId=$subscriptionId}{else}{url op="selectSubscriber" path="institutional"}{/if}" class="action">{translate key="common.select"}</a>
			<input type="hidden" name="userId" id="userId" value="{$userId|escape}"/>
		</td>
	</tr>
	{include file="subscription/subscriptionFormUser.tpl"}
</table>

<br />
<div class="separator"></div>
<br />


<div class="form-group">
	<div class="col-md-3 control-label">
		{fieldLabel name="notes" key="manager.subscriptions.form.notes"}
	</div>
	<div class="col-md-7">
		<textarea name="notes" id="notes" cols="40" rows="6" class="form-control">{$notes|escape}</textarea>
	</div>
</div>
<div class="form-group">
	<div class="col-md-offset-3">
		<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> {if not $subscriptionId}<input type="submit" name="createAnother" value="{translate key="manager.subscriptions.form.saveAndCreateAnother"}" class="btn btn-primary" /> {/if}<input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="subscriptions" path="institutional" escape=false}'" /></p>
	</div>
</div>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{include file="common/footer.tpl"}

