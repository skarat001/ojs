{**
 * templates/payments/payMethodSettingsForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to edit payment settings.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.payment.paymentMethods"}
{include file="common/header.tpl"}
{/strip}

		<ul class="menu">
			<ul class="nav nav-pills ">
				<li class="nav-item "><a href="{url op="payments"}" class="nav-link">{translate key="manager.payment.options"}</a></li>
				<li class="nav-item active"><a href="{url op="payMethodSettings"}" class="nav-link">{translate key="manager.payment.paymentMethods"}</a></li>
				<li class="nav-item "><a href="{url op="viewPayments"}" class="nav-link">{translate key="manager.payment.records"}</a></li>

			</ul>
			<hr>
{include file="common/formErrors.tpl"}

<script type="text/javascript">
<!--

{literal}
function changePaymentMethod() {
	document.getElementById('paymentSettingsForm').action="{/literal}{url|escape:"javascript" op="payMethodSettings" escape=false}{literal}";
		document.getElementById('paymentSettingsForm').submit();
	}

	{/literal}
// -->
</script>

<form method="post" id="paymentSettingsForm" action="{url op="savePayMethodSettings"}" class="form-horizontal">

<p>{translate key="manager.payment.paymentMethod.description"}</p>



			{assign var=pluginIndex value=1}
			<h4>{translate key="manager.payment.paymentMethods"}</h4>
			{foreach from=$paymentMethodPlugins item=plugin}
			<div class="form-group">
			<div class="radio">
			<label for="paymentMethodPluginName-{$pluginIndex|escape}">
				<input type="radio" name="paymentMethodPluginName" id="paymentMethodPluginName-{$pluginIndex|escape}" value="{$plugin->getName()|escape}" onclick="changePaymentMethod();" {if $paymentMethodPluginName == $plugin->getName()}checked="checked" {/if}/> <strong>{$plugin->getDisplayName()|escape}</strong></label>
				<p>{$plugin->getDescription()}</p>
				{assign var=pluginIndex value=$pluginIndex+1}

				</div>
				</div>
			{/foreach}
		
	{call_hook name="Template::Manager::Payment::displayPaymentSettingsForm" plugin=$paymentMethodPluginName}
<br/><br/>
<div class="form-group">
<div class="col-md-offset-1">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="manager"}'" /></p>
</div></div>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}

