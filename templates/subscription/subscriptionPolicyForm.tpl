{**
 * templates/subscription/subscriptionPolicyForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Setup subscription policies.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.subscriptionPolicies"}
{assign var="pageId" value="manager.subscriptionPolicies"}
{include file="common/header.tpl"}
{/strip}

<ul class="menu">
	<ul class="nav nav-pills navsubs">
		<li class="nav-item "><a href="{url op="subscriptionsSummary"}" class="nav-link">{translate key="manager.subscriptions.summary"}</a></li>
		<li class="nav-item "><a href="{url op="subscriptions" path="individual"}" class="nav-link">{translate key="manager.individualSubscriptions"}</a></li>
		<li class="nav-item "><a href="{url op="subscriptions" path="institutional"}" class="nav-link">{translate key="manager.institutionalSubscriptions"}</a></li>
		<li class="nav-item"><a href="{url op="subscriptionTypes" }" class="nav-link">{translate key="manager.subscriptionTypes"}</a></li>
		<li class="nav-item active"><a href="{url op="subscriptionPolicies" }" class="nav-link">{translate key="manager.subscriptionPolicies"}</a></li>
		<li class="nav-item"><a href="{url op="payments" }" class="nav-link">{translate key="manager.payments"}</a></li>
	</ul>
	<hr>

{if $subscriptionPoliciesSaved}
<br/>
{translate key="manager.subscriptionPolicies.subscriptionPoliciesSaved"}<br />
{/if}

<form id="subscriptionPolicies" method="post" action="{url op="saveSubscriptionPolicies"}" class="form-horizontal">
{include file="common/formErrors.tpl"}

	<script type="text/javascript">
		{literal}
		<!--
			function toggleAllowSetDelayedOpenAccessDuration(form) {
				form.delayedOpenAccessDuration.disabled = !form.delayedOpenAccessDuration.disabled;
			}
			function toggleAllowSetBeforeWeeksReminder(form) {
				form.numWeeksBeforeSubscriptionExpiryReminder.disabled = !form.numWeeksBeforeSubscriptionExpiryReminder.disabled;
			}
			function toggleAllowSetAfterWeeksReminder(form) {
				form.numWeeksAfterSubscriptionExpiryReminder.disabled = !form.numWeeksAfterSubscriptionExpiryReminder.disabled;
			}
		// -->
		{/literal}
	</script>

<div id="subscriptionContact">
<h3>{translate key="manager.subscriptionPolicies.subscriptionContact"}</h3>
<p>{translate key="manager.subscriptionPolicies.subscriptionContactDescription"}</p>

{if count($formLocales) > 1}
	
	{fieldLabel name="formLocale" key="form.formLanguage"}

			{url|assign:"subscriptionPoliciesUrl" op="subscriptionPolicies" escape=false}
			{form_language_chooser form="subscriptionPolicies" url=$subscriptionPoliciesUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
	
{/if}

<div class="form-group">
<div class="col-md-2 control-label">
{fieldLabel name="subscriptionName" key="user.name"}
</div>
<div class="col-md-7">
<input type="text" name="subscriptionName" id="subscriptionName" value="{$subscriptionName|escape}" size="30" maxlength="60" class="form-control" />
</div>
</div>
<div class="form-group">
<div class="col-md-2 control-label">
{fieldLabel name="subscriptionEmail" key="user.email"}
</div>
<div class="col-md-7">
<input type="text" name="subscriptionEmail" id="subscriptionEmail" value="{$subscriptionEmail|escape}" size="30" maxlength="90" class="form-control" />
</div>
</div>
<div class="form-group">
<div class="col-md-2 control-label">
{fieldLabel name="subscriptionPhone" key="user.phone"}
</div>
<div class="col-md-7">
<input type="text" name="subscriptionPhone" id="subscriptionPhone" value="{$subscriptionPhone|escape}" size="15" maxlength="24" class="form-control" />
</div>
</div>
<div class="form-group">
<div class="col-md-2 control-label">
{fieldLabel name="subscriptionFax" key="user.fax"}
</div>
<div class="col-md-7">
<input type="text" name="subscriptionFax" id="subscriptionFax" value="{$subscriptionFax|escape}" size="15" maxlength="24" class="form-control" />
</div>
</div>

<div class="form-group">
<div class="col-md-2 control-label">

{fieldLabel name="subscriptionMailingAddress" key="common.mailingAddress"}
</div>
<div class="col-md-7">
<textarea name="subscriptionMailingAddress" id="subscriptionMailingAddress" rows="6" cols="40" class="form-control">{$subscriptionMailingAddress|escape}</textarea>
</div>
</div>

</div>

<div class="separator"></div>

<div id="additionalInformation">
<h3>{translate key="manager.subscriptionPolicies.subscriptionAdditionalInformation"}</h3>
<p>{translate key="manager.subscriptionPolicies.subscriptionAdditionalInformationDescription"}</p>
<p>
	<textarea name="subscriptionAdditionalInformation[{$formLocale|escape}]" id="subscriptionAdditionalInformation" rows="12" cols="60" class="form-control">{$subscriptionAdditionalInformation[$formLocale]|escape}</textarea>
	<br />
	<span class="instruct">{translate key="manager.subscriptionPolicies.htmlInstructions"}</span>
</p>
</div>

<div class="separator"></div>

<div id="expiry">
<h3>{translate key="manager.subscriptionPolicies.expiry"}</h3>
<p>{translate key="manager.subscriptionPolicies.expiryDescription"}</p>

<p>{translate key="manager.subscriptionPolicies.expirySelectOne"}</p>


<div class="form-group radio">
<div class="col-md-offset-1">
<label>
			<input type="radio" name="subscriptionExpiryPartial" id="subscriptionExpiryPartial-0" value="0"{if not $subscriptionExpiryPartial} checked="checked"{/if class="pull-right" } />
			<strong>
			{translate key="manager.subscriptionPolicies.expiryFull"}</strong>
			<br />
			<span class="instruct">{translate key="manager.subscriptionPolicies.expiryFullDescription"}</span>
</label>
</div>
</div>
			
			
		
	<div class="form-group radio">
<div class="col-md-offset-1">
<label>
			<input type="radio" name="subscriptionExpiryPartial" id="subscriptionExpiryPartial-1" value="1"{if $subscriptionExpiryPartial} checked="checked"{/if} />
		
			<strong>{translate key="manager.subscriptionPolicies.expiryPartial"}</strong>
			<br />
			<span class="instruct">{translate key="manager.subscriptionPolicies.expiryPartialDescription"}</span>
</label>
</div>
</div>
	

<div class="separator"></div>

<div id="expiryReminders">
<h3>{translate key="manager.subscriptionPolicies.expiryReminders"}</h3>
<p>{translate key="manager.subscriptionPolicies.expiryRemindersDescription"}</p>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionExpiryReminderBeforeWeeks" id="enableSubscriptionExpiryReminderBeforeWeeks" value="1" onclick="toggleAllowSetBeforeWeeksReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled" {elseif $enableSubscriptionExpiryReminderBeforeWeeks} checked="checked"{/if} />&nbsp;
	{translate key="manager.subscriptionPolicies.expiryReminderBeforeWeeks1"}
	</label>
	<select name="numWeeksBeforeSubscriptionExpiryReminder" id="numWeeksBeforeSubscriptionExpiryReminder" class="selectMenu"{if not $enableSubscriptionExpiryReminderBeforeWeeks || !$scheduledTasksEnabled} disabled="disabled"{/if}>{html_options options=$validWeeks selected=$numWeeksBeforeSubscriptionExpiryReminder}</select>
	{fieldLabel name="numWeeksBeforeSubscriptionExpiryReminder" key="manager.subscriptionPolicies.expiryReminderBeforeWeeks2"}
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionExpiryReminderAfterWeeks" id="enableSubscriptionExpiryReminderAfterWeeks" value="1" onclick="toggleAllowSetAfterWeeksReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled" {elseif $enableSubscriptionExpiryReminderAfterWeeks} checked="checked"{/if} />&nbsp;
	{translate key="manager.subscriptionPolicies.expiryReminderAfterWeeks1"}</label>
	<select name="numWeeksAfterSubscriptionExpiryReminder" id="numWeeksAfterSubscriptionExpiryReminder" class="selectMenu"{if not $enableSubscriptionExpiryReminderAfterWeeks || !$scheduledTasksEnabled} disabled="disabled"{/if}>{html_options options=$validWeeks selected=$numWeeksAfterSubscriptionExpiryReminder}</select>
	{fieldLabel name="numWeeksAfterSubscriptionExpiryReminder" key="manager.subscriptionPolicies.expiryReminderAfterWeeks2"}
</div>
</div>

{if !$scheduledTasksEnabled} 
	<br/>
	{translate key="manager.subscriptionPolicies.expiryRemindersDisabled"}
{/if}
</div>

<div class="separator"></div>

<div id="onlinePaymentNotifications">
<h3>{translate key="manager.subscriptionPolicies.onlinePaymentNotifications"}</h3>
<p>{translate key="manager.subscriptionPolicies.onlinePaymentNotificationsDescription"}</p>
{if $journalPaymentsEnabled && $acceptSubscriptionPayments}
{assign var=paymentsEnabled value=true}
{/if}
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionOnlinePaymentNotificationPurchaseIndividual" id="enableSubscriptionOnlinePaymentNotificationPurchaseIndividual" value="1" {if !$paymentsEnabled} disabled="disabled" {elseif $enableSubscriptionOnlinePaymentNotificationPurchaseIndividual} checked="checked"{/if} />
	{translate key="manager.subscriptionPolicies.enableSubscriptionOnlinePaymentNotificationPurchaseIndividual"}</label>
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionOnlinePaymentNotificationPurchaseInstitutional" id="enableSubscriptionOnlinePaymentNotificationPurchaseInstitutional" value="1" {if !$paymentsEnabled} disabled="disabled" {elseif $enableSubscriptionOnlinePaymentNotificationPurchaseInstitutional} checked="checked"{/if} />
	{translate key="manager.subscriptionPolicies.enableSubscriptionOnlinePaymentNotificationPurchaseInstitutional"}
	</label>
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionOnlinePaymentNotificationRenewIndividual" id="enableSubscriptionOnlinePaymentNotificationRenewIndividual" value="1" {if !$paymentsEnabled} disabled="disabled" {elseif $enableSubscriptionOnlinePaymentNotificationRenewIndividual} checked="checked"{/if} />
	{translate key="manager.subscriptionPolicies.enableSubscriptionOnlinePaymentNotificationRenewIndividual"}
	</label>
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableSubscriptionOnlinePaymentNotificationRenewInstitutional" id="enableSubscriptionOnlinePaymentNotificationRenewInstitutional" value="1" {if !$paymentsEnabled} disabled="disabled" {elseif $enableSubscriptionOnlinePaymentNotificationRenewInstitutional} checked="checked"{/if} />
	{translate key="manager.subscriptionPolicies.enableSubscriptionOnlinePaymentNotificationRenewInstitutional"}
	</label>
</div>
</div>
{translate key="manager.subscriptionPolicies.onlinePaymentPurchaseInstitutionalDescription"}
<br />
{if !$paymentsEnabled}
	<br />
	{translate key="manager.subscriptionPolicies.onlinePaymentDisabled"}
{/if}
</div>

<div class="separator"></div>

<div id="openAccessOptions">
<h3>{translate key="manager.subscriptionPolicies.openAccessOptions"}</h3>
<p>{translate key="manager.subscriptionPolicies.openAccessOptionsDescription"}</p>

	<h4>{translate key="manager.subscriptionPolicies.delayedOpenAccess"}</h4>
	<p>{translate key="manager.subscriptionPolicies.delayedOpenAccessDescription"}</p>
		<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableDelayedOpenAccess" id="enableDelayedOpenAccess" value="1" onclick="toggleAllowSetDelayedOpenAccessDuration(this.form)" {if $enableDelayedOpenAccess} checked="checked"{/if} />&nbsp;
	{translate key="manager.subscriptionPolicies.delayedOpenAccessDescription1"}
	</label>
	<select name="delayedOpenAccessDuration" id="delayedOpenAccessDuration" class="selectMenu" {if not $enableDelayedOpenAccess} disabled="disabled"{/if}>{html_options options=$validDuration selected=$delayedOpenAccessDuration}</select>
	{fieldLabel name="delayedOpenAccessDuration" key="manager.subscriptionPolicies.delayedOpenAccessDescription2"}
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableOpenAccessNotification" id="enableOpenAccessNotification" value="1"{if !$scheduledTasksEnabled} disabled="disabled" {elseif $enableOpenAccessNotification} checked="checked"{/if} />&nbsp;
	{translate key="manager.subscriptionPolicies.openAccessNotificationDescription"}
	</label>
	{if !$scheduledTasksEnabled}

		<br/>
		{translate key="manager.subscriptionPolicies.openAccessNotificationDisabled"}
	{/if}
	</div>
</div>


	<p>{translate key="manager.subscriptionPolicies.delayedOpenAccessPolicyDescription"}</p>
	<p>
	<textarea name="delayedOpenAccessPolicy[{$formLocale|escape}]" id="delayedOpenAccessPolicy" rows="12" cols="60" class="form-control">{$delayedOpenAccessPolicy[$formLocale]|escape}</textarea>
	<br />
	<span class="instruct">{translate key="manager.subscriptionPolicies.htmlInstructions"}</span>
	</p>

	<h4>{translate key="manager.subscriptionPolicies.authorSelfArchive"}</h4>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<input type="checkbox" name="enableAuthorSelfArchive" id="enableAuthorSelfArchive" value="1"{if $enableAuthorSelfArchive} checked="checked"{/if} />&nbsp;
	{translate key="manager.subscriptionPolicies.authorSelfArchiveDescription"}
	</label>
</div>
</div>
	<div class="form-group">
<div class="col-md-offset-1">
<label>
	<textarea name="authorSelfArchivePolicy[{$formLocale|escape}]" id="authorSelfArchivePolicy" rows="12" cols="60" class="form-control">{$authorSelfArchivePolicy[$formLocale]|escape}</textarea>
	<br />
	<span class="instruct">{translate key="manager.subscriptionPolicies.htmlInstructions"}</span>
</div>
</div>
</div>

<div class="separator"></div>

	<div class="form-group">
<div class="col-md-offset-1">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="subscriptionPolicies" escape=false}'" /></p>
</div>
</div>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}

