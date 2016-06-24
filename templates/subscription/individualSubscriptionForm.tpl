{**
 * templates/subscription/individualSubscriptionForm.tpl
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
	{url|assign:"currentUrl" op="editSubscription" path="individual"|to_array:$subscriptionId userId=$userId}
{else}
	{assign var="pageTitle" value="manager.subscriptions.create"}
	{url|assign:"currentUrl" op="createSubscription" path="individual" userId=$userId}
{/if}
{assign var="pageId" value="manager.subscriptions.individualSubscriptionForm"}
{include file="common/header.tpl"}
{/strip}

<br/>

<form method="post" id="subscriptionForm" action="{url op="updateSubscription" path="individual"}" class="form-horizontal">
{if $subscriptionId}
<input type="hidden" name="subscriptionId" value="{$subscriptionId|escape}" />
{/if}

{include file="common/formErrors.tpl"}


{if count($formLocales) > 1}
<div class="form-group">
<div class="col-md-3 control-label">
	{fieldLabel name="formLocale" key="form.formLanguage"}
</div>
<div class="col-md-6">
			{if $subscriptionId}
				{url|assign:"formUrl" op="editSubscription" path="individual"|to_array:$subscriptionId userId=$userId escape=false}
			{else}
				{url|assign:"formUrl" op="createSubscription" path="individual" escape=false}
			{/if}
			{form_language_chooser form="subscriptionForm" url=$formUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
		</div>
{/if}
{include file="subscription/subscriptionForm.tpl"}

{* For new subscriptions, select end date for default subscription type *}
{if !$subscriptionId}
	<script type="text/javascript">
	<!--
	chooseEndDate();
	// -->
	</script>
{/if}

<br />
<div class="separator"></div>
<br />

<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="userId" required="true" key="manager.subscriptions.form.userId"}
</div>
<div class="col-md-6">
<span>
		{assign var=emailString value="$userFullName <$userEmail>"}
		{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl}
		{$username|escape}&nbsp;&nbsp;{icon name="mail" url=$url}&nbsp;&nbsp;<a href="{if $subscriptionId}{url op="selectSubscriber" path="individual" subscriptionId=$subscriptionId}{else}{url op="selectSubscriber" path="individual"}{/if}" class="action">{translate key="common.select"}</a>
		<input type="hidden" name="userId" id="userId" value="{$userId|escape}"/>
		</span>
		</div>
		</div>

{include file="subscription/subscriptionFormUser.tpl"}



<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="notes" key="manager.subscriptions.form.notes"}
</div>
<div class="col-md-6">
<textarea name="notes" id="notes" cols="40" rows="6" class="form-control">{$notes|escape}</textarea>
	</div>
		</div>
<div class="form-group">
<div class="col-md-8 col-md-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> {if not $subscriptionId}<input type="submit" name="createAnother" value="{translate key="manager.subscriptions.form.saveAndCreateAnother"}" class="btn btn-primary" /> {/if}<input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="subscriptions" path="individual" escape=false}'" /></p>
</div>
</div>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</form>



{include file="common/footer.tpl"}

